# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::BConf;
use strict;
use base 'Bivio::BConf';

sub IS_2014STYLE {
    return 1;
}

sub merge_overrides {
    my($proto, $host) = @_;
    return Bivio::IO::Config->merge_list(
	{
	    $proto->merge_class_loader({
		delegates => [
		    'Bivio::Agent::TaskId',
		    'Bivio::TypeError',
		],
		maps => {
		    Action => ['ProjEx::Action'],
		    Delegate => ['ProjEx::Delegate'],
		    Facade => ['ProjEx::Facade'],
		    Model => ['ProjEx::Model'],
		    ShellUtil => ['ProjEx::Util'],
		    TestLanguage => ['ProjEx::Test'],
		    Type => ['ProjEx::Type'],
		    UIXHTML => ['ProjEx::UIXHTML'],
		    View => ['ProjEx::View'],
		},
	    }),
	    'Bivio::UI::Facade' => {
		default => 'ProjEx',
		http_host => 'www.PROD-DOMAIN',
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
	},
	$proto->default_merge_overrides({
	    version => $proto->CURRENT_VERSION,
	    root => 'ProjEx',
	    prefix => 'projex',
	    owner => 'COPYRIGHT-HOLDER',
	}),
    );
}

1;
