# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Delegate::TaskId;
use strict;
use base 'Bivio::Delegate::SimpleTaskId';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub get_delegate_info {
    my($proto) = @_;
    return $proto->merge_task_info(qw(base), => [
	[qw(
	    MY_SITE
	    4
	    GENERAL
	    ANY_USER
	    Action.ClientRedirect->execute_next
	    next=SITE_ROOT
	)],
	[qw(
	    LOGIN
	    501
	    GENERAL
	    ANYBODY
	    Action.UserLogout
	    Model.UserLoginForm
            View.login
	    next=MY_SITE
	)],
	[qw(
	    USER_CREATE
	    502
	    GENERAL
	    ANYBODY
	    Action.UserLogout
	    Model.UserCreateForm
	    View.user-create
	    next=MY_SITE
	)],
	[qw(
	    LOGOUT
	    503
	    GENERAL
	    ANYBODY
	    Action.UserLogout
            Action.ClientRedirect->execute_next
            next=SITE_ROOT
	)],
    ]);
}

1;
