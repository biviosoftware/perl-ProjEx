# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Model::UserCreateForm;
use strict;
$ProjEx::Model::UserCreateForm::VERSION = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
$_ = $ProjEx::Model::UserCreateForm::VERSION;

=head1 NAME

ProjEx::Model::UserCreateForm - register users

=head1 RELEASE SCOPE

ProjEx

=head1 SYNOPSIS

    use ProjEx::Model::UserCreateForm;

=cut

=head1 EXTENDS

L<Bivio::Biz::Model::UserCreateForm>

=cut

use Bivio::Biz::Model::UserCreateForm;
@ProjEx::Model::UserCreateForm::ISA = ('Bivio::Biz::Model::UserCreateForm');

=head1 DESCRIPTION

C<ProjEx::Model::UserCreateForm>

=cut

#=IMPORTS

#=VARIABLES

=head1 METHODS

=cut

=for html <a name="execute_ok"></a>

=head2 execute_ok()

Creates user.

=cut

sub execute_ok {
    my($self) = @_;
    Bivio::IO::Alert->warn('You need to remove this method to create users');
    return;
}

=for html <a name="internal_initialize"></a>

=head2 internal_initialize() : hash_ref

Returns model configuration.

=cut

sub internal_initialize {
    my($self) = @_;
    return $self->merge_initialize_info($self->SUPER::internal_initialize, {
        version => 1,
	visible => [
#TODO:      You put other fields you require on registration here
	    'Address.street1',
	    'Address.street2',
	    'Address.city',
	    'Address.state',
	    'Address.zip',
	],
    });
}

#=PRIVATE SUBROUTINES

=head1 COPYRIGHT

Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All Rights Reserved.

=head1 VERSION

$Id$

=cut

1;
