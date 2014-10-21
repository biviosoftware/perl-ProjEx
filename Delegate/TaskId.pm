# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Delegate::TaskId;
use strict;
use Bivio::Base 'Delegate';


sub get_delegate_info {
    my($proto) = @_;
    return $proto->merge_task_info(@{$proto->standard_components}, [
#TODO:  Your tasks go here
    ]);
}

1;
