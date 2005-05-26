# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Facade::ProjEx;
use strict;
$ProjEx::Facade::ProjEx::VERSION = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
$_ = $ProjEx::Facade::ProjEx::VERSION;

=head1 NAME

ProjEx::Facade::ProjEx - main production and default facade

=head1 RELEASE SCOPE

bOP

=head1 SYNOPSIS

    use ProjEx::Facade::ProjEx;

=cut

=head1 EXTENDS

L<Bivio::UI::Facade>

=cut

use Bivio::UI::Facade;
@ProjEx::Facade::ProjEx::ISA = ('Bivio::UI::Facade');

=head1 DESCRIPTION

C<ProjEx::Facade::ProjEx> is the main production and default Facade.

=cut

#=IMPORTS

#=VARIABLES
my($_SELF) = __PACKAGE__->new({
    clone => undef,
    is_production => 1,
    uri => 'FACADE-URI',
    http_host => 'PROD-DOMAIN',
    mail_host => 'PROD-DOMAIN',
    Color => [
	[page_link => -1],
	[['page_vlink', 'page_alink'] => -1],
	[page_link_hover => -1],
	[page_text => 0],
	[page_bg => 0xFFFFFF],
	[page_heading => -1],
	[error => 0x990000],
	[warning => 0x990001],
	[table_heading => -1],
	[table_even_row_bg => 0xF3F3F3],
	[table_odd_row_bg => -1],
	[table_separator => 0],
	[summary_line => 0x66CC66],
    ],
    Font => [
	[default => [
	    'family=verdana,arial,helvetica,geneva,sunsans-regular,sans-serif',
	    'size=small',
	]],
	[error => ['color=error', 'bold']],
	[form_field_error => ['color=error', 'smaller', 'bold']],
	[form_field_error_label => ['color=error', 'italic']],
	[page_heading => ['bold']],
	[table_heading => ['color=table_heading', 'bold']],
	[warning => ['color=warning', 'bold']],
	[[qw(
		checkbox
		form_field_label
		form_submit
		input_field
		mailto
		number_cell
		page_text
		radio
		search_field
		table_cell
	)] => []],

	# Add your own here
	[hello => ['class=hello']],
    ],
    FormError => [
	[NULL => 'You must supply a value for vs_fe("label");.'],
    ],
    HTML => [
	[want_secure => 0],
	[table_default_align => 'left'],
    ],
    Task => [
	[CLUB_HOME => '?'],
	[DEFAULT_ERROR_REDIRECT_FORBIDDEN => undef],
	[FAVICON_ICO => '/favicon.ico'],
	[FORBIDDEN => undef],
	[LOCAL_FILE_PLAIN => ['/i/*']],
	[LOGIN => undef],
#TODO:	    [LOGOUT => 'pub/logout'],
	[MY_SITE => undef],
	[MY_CLUB_SITE => undef],
	[SHELL_UTIL => undef],
	[SITE_ROOT => '/*'],
	[USER_HOME => '?'],
    ],
    Text => [
	[support_email => 'support'],
#TODO:	    [support_phone => '(800) 555-1212'],
	[site_name => q{COPYRIGHT-HOLDER}],
	[home_page_uri => '/hm/index'],
	[view_execute_uri_prefix => 'site_root/'],
	[favicon_uri => '/i/favicon.ico'],
	[none => ''],
	[Image_alt => [
	    dot => '',
	    bivio_power => 'Operated by bivio Software, Inc.',
	]],
	[ok_button => '   OK   '],
	[cancel_button => ' Cancel '],
    ],
});

=head1 METHODS

=cut

#=PRIVATE METHODS

=head1 COPYRIGHT

Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.

=head1 VERSION

$Id$

=cut

1;
