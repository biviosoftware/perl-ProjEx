# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All Rights Reserved.
# $Id$
package ProjEx::Util::SQL;
use strict;
$ProjEx::Util::SQL::VERSION = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
$_ = $ProjEx::Util::SQL::VERSION;

=head1 NAME

ProjEx::Util::SQL - ddl configuration

=head1 RELEASE SCOPE

ProjEx

=head1 SYNOPSIS

    use ProjEx::Util::SQL;

=cut

=head1 EXTENDS

L<Bivio::Util::SQL>

=cut

use Bivio::Util::SQL;
@ProjEx::Util::SQL::ISA = ('Bivio::Util::SQL');

=head1 DESCRIPTION

C<ProjEx::Util::SQL>

=cut

#=IMPORTS

#=VARIABLES

=head1 METHODS

=cut

=for html <a name="ddl_files"></a>

=head2 ddl_files() : array_ref

Returns DDL SQL file names used to create/destroy database.

=cut

sub ddl_files {
    return shift->SUPER::ddl_files(['bOP', 'projex']);
}

#=PRIVATE SUBROUTINES

=head1 COPYRIGHT

Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All Rights Reserved.

=head1 VERSION

$Id$

=cut

1;
