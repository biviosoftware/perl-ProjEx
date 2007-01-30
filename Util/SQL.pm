# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All Rights Reserved.
# $Id$
package ProjEx::Util::SQL;
use strict;
use base('Bivio::Util::SQL');

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub ddl_files {
    return shift->SUPER::ddl_files(['bOP', 'projex']);
}

sub initialize_test_data {
    my($self) = @_;
    my($req) = $self->get_request;
    $self->create_test_user('buser');
    $self->create_test_user('root');
    $self->new_other('RealmRole')->make_super_user;
    $req->set_realm(undef);
    $self->model(ForumForm => {
        'RealmOwner.display_name' => 'Unit Test Forum',
	'RealmOwner.name' => 'bforum',
    });
    return;
}

1;
