# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All Rights Reserved.
# $Id$
package ProjEx::Util::SQL;
use strict;
use Bivio::Base 'Bivio::Util::SQL';

# export BCONF=~/bconf/projex.bconf
# cd files/ddl
# perl -w ../../Util/projex-sql init_dbms
# perl -w ../../Util/projex-sql create_test_db

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub ddl_files {
    return shift->SUPER::ddl_files(['bOP', 'projex']);
}

sub initialize_db {
    return shift->call_super_before(\@_, sub {
        shift->new_other('SiteForum')->init;
	return;
    });
}

sub initialize_test_data {
    return shift->call_super_before(\@_, sub {
        shift->new_other('TestUser')->init;
	return;
    });
}

1;
