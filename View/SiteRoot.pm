# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::View::SiteRoot;
use strict;
use Bivio::Base 'Bivio::UI::XHTML::View::SiteRoot';
use Bivio::UI::ViewLanguageAUTOLOAD;

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub hm_index {
    return shift->internal_body_prose(<<'EOF');
P('Here is the first paragraph of text which will not be indented. But it will go on and on...');
P_prose('This is a second paragraph which is indented of text which WILL be indented.  This is just some more text to demonstrate the indent.');
EOF
}

1;
