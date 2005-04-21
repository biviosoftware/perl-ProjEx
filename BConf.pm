# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::BConf;
use strict;
$ProjEx::BConf::VERSION = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
$_ = $ProjEx::BConf::VERSION;

=head1 NAME

ProjEx::BConf - default configuration

=head1 RELEASE SCOPE

RELEASE-SCOPE

=head1 SYNOPSIS

    use ProjEx::BConf;

=cut

=head1 EXTENDS

L<Bivio::BConf>

=cut

use Bivio::BConf;
@ProjEx::BConf::ISA = ('Bivio::BConf');

=head1 DESCRIPTION

Configuration.

=cut

#=IMPORTS
# NOTE: Only import the bare minimum, because this class must be
# initialized just after Bivio::IO::Config.

#=VARIABLES

=head1 METHODS

=cut

=for html <a name="dev_overrides"></a>

=head2 dev_overrides(string pwd, string host, string user, int http_port) : hash_ref

Development environment configuration.

=cut

sub dev_overrides {
    my($proto, $pwd, $host, $user, $http_port) = @_;
    return {
    };
}

=for html <a name="merge_overrides"></a>

=head2 merge_overrides(string host) : hash_ref

Base configuration.

=cut

sub merge_overrides {
    my($proto, $host) = @_;
    return {
	'Bivio::Ext::DBI' => {
	    database => 'projex',
	    user => 'projexuser',
	    password => 'projexpass',
#TODO:	    connection => 'Bivio::SQL::Connection::Postgres',
	},
	$proto->merge_class_loader({
	    delegates => {
		'Bivio::Agent::HTTP::Cookie' => 'Bivio::Delegate::Cookie',
		'Bivio::Agent::TaskId' => 'ProjEx::Delegate::TaskId',
#TODO:		'Bivio::Auth::Support' => 'Bivio::Delegate::SimpleAuthSupport',
	    },
	    maps => {
#TODO:		Action => ['ProjEx::Action'],
		Facade => ['ProjEx::Facade'],
#TODO:		HTMLWidget => ['ProjEx::HTMLWidget'],
#TODO:		Model => ['ProjEx::Model'],
		TestLanguage => ['ProjEx::Test'],
#TODO:		Type => ['ProjEx::Type'],
	    },
	}),
	'Bivio::UI::Facade' => {
	    default => 'ProjEx',
	    http_suffix => 'PROD-DOMAIN',
	    mail_host => 'PROD-DOMAIN',
	},
        $proto->merge_http_log({
            ignore_list => [
            ],
	    error_list => [
	    ],
	    critical_list => [
	    ],
        }),
	'Bivio::Test::Language::HTTP' => {
	    home_page_uri => 'http://FACADE-URI.bivio.biz',
	},
	'Bivio::Test::Util' => {
	    nightly_output_dir => '/home/FACADE-URI-testsuite',
	    nightly_cvs_dir => 'perl/ProjEx',
	},
	'Bivio::Util::Release' => {
	    projects => [
		[ProjEx => projex => 'COPYRIGHT-HOLDER'],
	    ],
	},
        'Bivio::Delegate::Cookie' => {
            tag => uc('projex'),
	},
    };
}

#=PRIVATE METHODS

=head1 COPYRIGHT

Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.

=head1 VERSION

$Id$

=cut

1;
