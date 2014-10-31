# Copyright (c) 2005-2014 bivio Software, Inc.  All Rights Reserved.
# $Id: Copy.pm,v 1.18 2014/10/30 23:28:31 moeller Exp $
package ProjEx::Util::Copy;
use strict;
use Bivio::Base 'Bivio.ShellUtil';
use File::Find ();
b_use('IO.ClassLoaderAUTOLOAD');

sub USAGE {
    return <<'EOF';
usage: projex-copy [options] command [args...]
commands:
    to RootPkg pfx legal-name [[facade-uri] [prod-domain] -- creates a new project
EOF
}

sub to {
    my($self, $root, $pfx, $legal, $uri, $domain) = @_;
    $self->usage_error($legal, ': expecting legal name which contains a space')
	unless $legal && $legal =~ /\s/;
    $self->usage_error($root, ': root must begin with upper case')
	unless $root =~ /^[A-Z]\w+$/;
    $self->usage_error($pfx, ': prefix must be all lower case')
	unless $pfx =~ /^[a-z0-9]+$/;
    $uri ||= lc($root);
    $domain ||= "$uri.com";
    $self->usage_error($uri, ': uri must be all lower case, word')
	unless $uri =~ /^[-a-z0-9]+$/;
    $self->usage_error($domain, ': invalid domain name')
	unless (Type_DomainName()->from_literal($domain))[0];
    my($perllib) = $ENV{PERLLIB};
    b_die('$PERLLIB must be set and end in perl/')
	unless ($perllib || '') =~ m{/perl$};
    IO_File()->chdir("$perllib/ProjEx");
    IO_File()->chdir('..');
    my($projex_dir) = "perl-ProjEx";
    my($pd) = IO_File()->absolute_path(IO_File()->mkdir_p("perl-$root"));
    IO_File()->symlink($pd, IO_File()->absolute_path($root, $perllib));
    my($year) = Type_DateTime()->now_as_year;
    my($vc_re) = Util_VC()->CONTROL_DIR_RE();
    File::Find::find({
	wanted => sub {
	    my($src) = $File::Find::name;
	    next if $_ eq '.';
	    (my $dst = $src) =~ s{ProjEx}{$root}g;
	    $dst =~ s{projuri}{$uri}g;
	    $dst =~ s{projex}{$pfx}g;
	    my($kb) = '';
	    if ($src =~ m{(?:^|/)(?:$vc_re|.*\.old|old|httpd|.*log|Copy.pm|README.md|projex-copy|.*\~$|db|tmp|WikiData)$} || -l $src) {
		$File::Find::prune = 1;
		return;
	    }
	    elsif (-d $src) {
		IO_File()->mkdir_p($dst, 0777);
	    }
	    else {
		my($data) = IO_File()->read($src);
		unless ($kb = -B $src ? '-kb' : '') {
		    $$data =~ s/projex/$pfx/g;
		    $$data =~ s/ProjEx/$root/g;
		    $$data =~ s/FACADE-URI/$uri/g;
		    $$data =~ s/COPYRIGHT-HOLDER/$legal/g;
		    $$data =~ s/COPYRIGHT-YEAR/$year/g;
		    $$data =~ s/PROD-DOMAIN/$domain/g;
		}
		IO_File()->write($dst, $data);
	    }
	    return;
	},
	no_chdir => 1,
    }, $projex_dir);
    return;
}

1;
