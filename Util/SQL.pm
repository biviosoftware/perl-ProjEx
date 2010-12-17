# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All Rights Reserved.
# $Id$
package ProjEx::Util::SQL;
use strict;
use Bivio::Base 'ShellUtil';

# export BCONF=~/bconf/projex.bconf
# cd files/ddl
# perl -w ../../Util/projex-sql init_dbms
# perl -w ../../Util/projex-sql create_test_db

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub ddl_files {
    return shift->SUPER::ddl_files(['bOP', 'projex']);
}

sub initialize_db {
    my($self) = shift;
    my(@res) = $self->SUPER::initialize_db(@_);
    $self->new_other('SiteForum')->init;
    return @res;
}

sub initialize_test_data {
    my($self) = @_;
    my(@res) = shift->SUPER::initialize_test_data(@_);
    $self->new_other('TestUser')->init;
    return @res;
}

1;
