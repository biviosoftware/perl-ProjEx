# Copyright (c) 2005 bivio Software, Inc.  All Rights Reserved.
# $Id$
package ProjEx::Util::Copy;
use strict;
use Bivio::Base 'Bivio::ShellUtil';
use Bivio::IO::File;
use File::Find ();

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

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
	unless $legal =~ /\s/;
    $self->usage_error($root, ': root must begin with upper case')
	unless $root =~ /^[A-Z]\w+$/;
    $self->usage_error($pfx, ': prefix must be all lower case')
	unless $pfx =~ /^[a-z0-9]+$/;
    $uri ||= lc($root);
    $domain ||= "$uri.com";
    $self->usage_error($uri, ': uri must be all lower case, word')
	unless $uri =~ /^[-a-z0-9]+$/;
    $self->usage_error($domain, ': invalid domain name')
	unless (Bivio::Type->get_instance('DomainName')
	->from_literal($domain))[0];
    my($perllib) = _match(__FILE__, '/ProjEx/Util/Copy.pm');
    Bivio::IO::File->chdir($perllib);
    $self->piped_exec('cvs update -Pd ProjEx Bivio/PetShop/files/ddl')
	if $ENV{CVSROOT};
    Bivio::IO::File->mkdir_p($root);
    my($year) = b_use('Type.DateTime')->now_as_year;
    my($cvs) = [];
    File::Find::find({
	wanted => sub {
	    my($src) = $File::Find::name;
	    next if $_ eq '.';
	    (my $dst = $src) =~ s{(?:ProjEx|Bivio/PetShop)}{$root}g;
	    $dst =~ s{projex}{$pfx}g;
	    my($kb) = '';
	    if ($src =~ m{(?:^|/)(?:CVS|.*\.old|old|httpd\.pid|.*\.log|log/|httpd.*conf|Copy.pm|projex-copy|.*\~$|db$|tmp$|WikiData$)} || -l $src) {
		$File::Find::prune = 1;
		return;
	    }
	    elsif (-d $src) {
		Bivio::IO::File->mkdir_p($dst, 0777);
	    }
	    else {
		my($data) = Bivio::IO::File->read($src);
		unless ($kb = -B $src ? '-kb' : '') {
		    $$data =~ s/projex/$pfx/g;
		    $$data =~ s/ProjEx/$root/g;
		    $$data =~ s/FACADE-URI/$uri/g;
		    $$data =~ s/COPYRIGHT-HOLDER/$legal/g;
		    $$data =~ s/COPYRIGHT-YEAR/$year/g;
		    $$data =~ s/PROD-DOMAIN/$domain/g;
		}
		Bivio::IO::File->write($dst, $data);
	    }
	    push(@$cvs, "cvs add $kb $dst")
		unless grep(/ \Q$dst\E$/, @$cvs);
	    return;
	},
	no_chdir => 1,
    }, 'ProjEx');
    symlink('.', "$root/files/$uri");
    if ($ENV{CVS}) {
	foreach my $c (sort(@$cvs)) {
	    $self->piped_exec($c);
	}
    }
    return;
}

sub _match {
    my($value, $suffix) = @_;
    my($re) = qr{(.+)$suffix$};
    return ($value =~ $re)[0] || b_die($value, ': does not match ', $re);
}

1;
