# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All Rights Reserved.
# $Id$
package ProjEx::Util::SQL;
use strict;
use Bivio::Base 'Bivio::Util::SQL';

# su - postgres -c 'createuser --no-createdb --no-adduser --pwprompt projexuser; createdb --owner projexuser projex'
# b_projex; cd files/ddl; ln -s ../../../Bivio/PetShop/files/ddl/bOP-tables.sql bOP-tables.sql; ln -s ../../../Bivio/PetShop/files/ddl/bOP-constraints.sql bOP-constraints.sql; ln -s ../../../Bivio/PetShop/files/ddl/bOP-sequences.sql bOP-sequences.sql
# perl -w ../../Util/projex-sql create_test_db

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
