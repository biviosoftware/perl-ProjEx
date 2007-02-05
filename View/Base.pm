package ProjEx::View::Base;
use strict;
use Bivio::Base 'Bivio::UI::XHTML::View::Base';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub VIEW_SHORTCUTS {
    return 'ProjEx::ViewShortcuts';
}

1;
