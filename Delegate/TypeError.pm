# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Delegate::TypeError;
use strict;
use Bivio::Base 'Delegate.SimpleTypeError';


sub get_delegate_info {
    return [
	@{shift->SUPER::get_delegate_info(@_)},
	YOUR_ERROR_HERE => [
	    501,
	    undef,
	    'Your error description here.',
	],
    ];
}

1;
