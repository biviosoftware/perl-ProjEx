# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Model::UserCreateForm;
use strict;
use base ('Bivio::Biz::Model::UserCreateForm');

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub execute_ok {
    my($self) = @_;
    Bivio::IO::Alert->warn('You need to remove this method to create users');
    return;
}

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

1;
