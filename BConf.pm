# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::BConf;
use strict;
use base 'Bivio::BConf';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub dev_overrides {
    my($proto, $pwd, $host, $user, $http_port) = @_;
    return {
    };
}

sub merge_overrides {
    my($proto, $host) = @_;
    return {
        $proto->default_merge_overrides(ProjEx => projex => 'COPYRIGHT-HOLDER'),
        $proto->merge_class_loader({
            delegates => {
		'Bivio::Agent::HTTP::Cookie' => 'Bivio::Delegate::Cookie',
		'Bivio::Agent::TaskId' => 'ProjEx::Delegate::TaskId',
	      	'Bivio::Auth::Support' => 'Bivio::Delegate::SimpleAuthSupport',
#TODO:	      	'Bivio::Auth::RealmType' => 'ProjEx::Delegate::RealmType',
		'Bivio::TypeError' => 'ProjEx::Delegate::TypeError',
	    },
	    maps => {
#TODO:	      	Action => ['ProjEx::Action'],
		Facade => ['ProjEx::Facade'],
#TODO:	      	HTMLWidget => ['ProjEx::HTMLWidget'],
#TODO:	      	Model => ['ProjEx::Model'],
		ShellUtil => ['ProjEx::Util'],
		TestLanguage => ['ProjEx::Test'],
#TODO:	      	Type => ['ProjEx::Type'],
		View => ['ProjEx::View'],
	    },
        }),
        'Bivio::UI::Facade' => {
	    default => 'ProjEx',
	    http_suffix => 'www.PROD-DOMAIN',
	    mail_host => 'PROD-DOMAIN',
        },
	'Bivio::Test::HTMLParser::Forms' => {
	    error_class => 'form_field_error',
	},
	'Bivio::Biz::Model::MailReceiveDispatchForm' => {
	    ignore_dashes_in_recipient => 1,
	},
        $proto->merge_http_log({
            ignore_list => [
            ],
	    error_list => [
	    ],
	    critical_list => [
	    ],
        }),
    };
}

1;
