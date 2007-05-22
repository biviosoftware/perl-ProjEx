# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::View::Base;
use strict;
use Bivio::Base 'View.ThreePartPage';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub VIEW_SHORTCUTS {
    return 'ProjEx::ViewShortcuts';
}

1;
