# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Facade::ProjEx;
use strict;
use base 'Bivio::UI::FacadeBase';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

my($_SELF) = __PACKAGE__->new({
    uri => 'FACADE-URI',
    http_host => 'www.PROD-DOMAIN',
    mail_host => 'PROD-DOMAIN',
    Text => [
	[site_name => q{COPYRIGHT-HOLDER}],
	[site_copyright => q{COPYRIGHT-HOLDER}],
    ],
});

1;
