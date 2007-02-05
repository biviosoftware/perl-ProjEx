# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::View::SiteRoot;
use strict;
use Bivio::Base 'Bivio::UI::XHTML::View::SiteRoot';
use Bivio::UI::ViewLanguageAUTOLOAD;

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub hm_index {
    return shift->internal_body_from_name_as_prose;
}

1;
