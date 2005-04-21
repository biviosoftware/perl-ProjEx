# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Delegate::TypeError;
use strict;
$ProjEx::Delegate::TypeError::VERSION = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
$_ = $ProjEx::Delegate::TypeError::VERSION;

=head1 NAME

ProjEx::Delegate::TypeError - additional type errors

=head1 RELEASE SCOPE

ProjEx

=head1 SYNOPSIS

    use ProjEx::Delegate::TypeError;

=cut

use Bivio::Delegate::SimpleTypeError;
@ProjEx::Delegate::TypeError::ISA = ('Bivio::Delegate::SimpleTypeError');

=head1 DESCRIPTION

C<ProjEx::Delegate::TypeError>

=cut

#=IMPORTS

#=VARIABLES

=head1 METHODS

=cut

=for html <a name="get_delegate_info"></a>

=head2 static get_delegate_info() : array_ref

Returns the type error declarations.

=cut

sub get_delegate_info {
    return [
	@{shift->SUPER::get_delegate_info(@_)},
	YOUR_ERROR_HERE => [
	    501,
	    undef,
	    'Your error description here.',
	],
    ];
}

#=PRIVATE METHODS

=head1 COPYRIGHT

Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.

=head1 VERSION

$Id$

=cut

1;
