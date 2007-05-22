# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Delegate::TaskId;
use strict;
use Bivio::Base 'Bivio::Delegate::TaskId';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub get_delegate_info {
    my($proto) = @_;
    return $proto->merge_task_info(@{$proto->all_components}, [
#TODO:  Your tasks go here
    ]);
}

1;
