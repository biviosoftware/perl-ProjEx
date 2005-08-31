# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Delegate::TaskId;
use strict;
$ProjEx::Delegate::TaskId::VERSION = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
$_ = $ProjEx::Delegate::TaskId::VERSION;

=head1 NAME

ProjEx::Delegate::TaskId - additional tasks

=head1 RELEASE SCOPE

ProjEx

=head1 SYNOPSIS

    use ProjEx::Delegate::TaskId;

=cut

use Bivio::Delegate::SimpleTaskId;
@ProjEx::Delegate::TaskId::ISA = ('Bivio::Delegate::SimpleTaskId');

=head1 DESCRIPTION

C<ProjEx::Delegate::TaskId>

=cut

#=IMPORTS

#=VARIABLES

=head1 METHODS

=cut

=for html <a name="get_delegate_info"></a>

=head2 static get_delegate_info() : array_ref

Returns the task declarations.

=cut

sub get_delegate_info {
    my($proto) = @_;
    return $proto->merge_task_info(shift->SUPER::get_delegate_info(@_), [
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

#=PRIVATE METHODS

=head1 COPYRIGHT

Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.

=head1 VERSION

$Id$

=cut

1;
