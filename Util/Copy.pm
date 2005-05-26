# Copyright (c) 2005 bivio Software, Inc.  All Rights Reserved.
# $Id$
package ProjEx::Util::Copy;
use strict;
$ProjEx::Util::Copy::VERSION = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
$_ = $ProjEx::Util::Copy::VERSION;

=head1 NAME

ProjEx::Util::Copy - copy files to another project

=head1 RELEASE SCOPE

ProjEx

=head1 SYNOPSIS

    use ProjEx::Util::Copy;

=cut

=head1 EXTENDS

L<Bivio::ShellUtil>

=cut

use Bivio::ShellUtil;
@ProjEx::Util::Copy::ISA = ('Bivio::ShellUtil');

=head1 DESCRIPTION

C<ProjEx::Util::Copy>

=cut


=head1 CONSTANTS

=cut

=for html <a name="USAGE"></a>

=head2 USAGE : string

See code.

=cut

sub USAGE {
    return <<'EOF';
usage: projex-copy [options] command [args...]
commands:
    to RootPkg pfx legal-name [[facade-uri] [prod-domain] -- creates a new project
EOF
}

#=IMPORTS
use Bivio::IO::File;
use File::Find ();

#=VARIABLES

=head1 METHODS

=cut

=for html <a name="to"></a>

=head2 to(string root, string pfx, string legal, string uri, string domain)

Copy files to I<root>, substituting values passed in to copies of the Projex/*
files.  I<pfx> is the abbreviated prefix for commands.  I<legal> is the legal
name, e.g. bivio Software, Inc.  I<uri> defaults to I<root> in all lower-case.
I<domain> defaults to I<uri>.com.

=cut

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
    $self->usage_error($uri, ': prefix must be all lower case, word')
	unless $uri =~ /^[-a-z0-9]+$/;
    $self->usage_error($domain, ': invalid domain name')
	unless (Bivio::Type->get_instance('DomainName')
		->from_literal($domain))[0];
    Bivio::IO::File->chdir("$ENV{HOME}/src/perl");
    $self->piped_exec('cvs update -Pd ProjEx Bivio/PetShop/files/ddl');
    Bivio::IO::File->mkdir_p($root);
    my($year) = Bivio::Type::DateTime->now_as_year;
    my($cvs) = [];
    File::Find::find({
	wanted => sub {
	    my($src) = $File::Find::name;
	    next if $_ eq '.';
	    (my $dst = $src) =~ s{(?:ProjEx|Bivio/PetShop)}{$root}g;
	    my($kb) = '';
	    if ($src =~ m{(?:^|/)(?:CVS|.*\.old|old|httpd\.pid|.*\.log|log|httpd.*conf|Copy.pm|projex-copy|.*\~$|petshop-)} || -l $src) {
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
    }, 'ProjEx', 'Bivio/PetShop/files/ddl');
    Bivio::IO::File->write("$ENV{HOME}/bconf/$pfx.bconf", <<"EOF");
use strict;
use ${root}::BConf;
${root}::BConf->dev(8888, {
    'Bivio::UI::Facade' => {
	local_file_root => '$ENV{HOME}/src/perl/${root}/files/',
    },
});
EOF
    symlink('.', "$root/files/$uri");
    foreach my $c (sort(@$cvs)) {
	$self->piped_exec($c);
    }
    return;
}

#=PRIVATE SUBROUTINES

=head1 COPYRIGHT

Copyright (c) 2005 bivio Software, Inc.  All Rights Reserved.

=head1 VERSION

$Id$

=cut

1;
