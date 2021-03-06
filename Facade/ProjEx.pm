# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Facade::ProjEx;
use strict;
use Bivio::Base 'UI.FacadeBase';


__PACKAGE__->new({
    uri => 'FACADE-URI',
    http_host => 'www.PROD-DOMAIN',
    mail_host => 'PROD-DOMAIN',
    is_production => 1,
    Text => [
	[site_name => q{COPYRIGHT-HOLDER}],
	[site_copyright => q{COPYRIGHT-HOLDER}],
	[home_page_uri => '/bp'],
    ],
});

1;
