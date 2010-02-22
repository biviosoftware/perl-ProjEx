# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Facade::ProjEx;
use strict;
use Bivio::Base 'Bivio::UI::FacadeBase';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

my($_SELF) = __PACKAGE__->new({
    uri => 'FACADE-URI',
    http_host => 'www.PROD-DOMAIN',
    mail_host => 'PROD-DOMAIN',
    Constant => [
	[ThreePartPage_want_ForumDropDown => 1],
	[ThreePartPage_want_dock_left_standard => 1],
    ],
    Text => [
	[site_name => q{COPYRIGHT-HOLDER}],
	[site_copyright => q{COPYRIGHT-HOLDER}],
	[home_page_uri => '/bp'],
    ],
});

1;
