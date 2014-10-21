# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::View::Base;
use strict;
use Bivio::Base 'View.ThreePartPage';
use Bivio::UI::ViewLanguageAUTOLOAD;


sub VIEW_SHORTCUTS {
    return 'UIXHTML.ViewShortcuts';
}

1;
