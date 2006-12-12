# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Facade::ProjEx;
use strict;
use base ('Bivio::UI::Facade');

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

my($_SELF) = __PACKAGE__->new({
    clone => undef,
    is_production => 1,
    uri => 'FACADE-URI',
    http_host => 'www.PROD-DOMAIN',
    mail_host => 'PROD-DOMAIN',
    Color => [
	[[qw(
	    table_separator
	    table_odd_row_bg
	    table_even_row_bg
	    page_alink
	    page_link
	    page_link_hover
	    page_bg
	    page_text
	    page_vlink
	    summary_line
	    error
	    warning
 	)] => -1],
    ],
    Font => [
	map([$_ => [qq{class=$_}]], qw{
	    error
	    form_field_error
	    form_field_error_label
	    form_field_label
	    warning
	}),
	[[qw{
	    default
	    checkbox
	    form_field_checkbox
	    form_field_description
	    form_submit
	    input_field
	    mailto
	    number_cell
	    page_heading
	    page_text
	    radio
	    search_field
	    table_cell
	    table_heading
	}] => []],
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
	[FAVICON_ICO => 'favicon.ico'],
	[FORBIDDEN => undef],
	[LOCAL_FILE_PLAIN => ['i/*', 'f/*']],
	[LOGIN => 'pub/login'],
	[LOGOUT => 'pub/logout'],
	[MY_SITE => 'my-site'],
	[MY_CLUB_SITE => undef],
	[SHELL_UTIL => undef],
	[SITE_ROOT => '*'],
	[USER_HOME => '?'],
	[USER_CREATE => 'pub/register'],
        [ROBOTS_TXT => '/robots.txt'],
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
	    home_logo => 'COPYRIGHT-HOLDER',
	    sort_up => 'This column sorted in descending order',
	    sort_down => 'This column sorted in ascending order',
	]],
	[ok_button => '   OK   '],
	[cancel_button => ' Cancel '],
	[['Email.email', 'login'] => 'Email Address'],
	[password => 'Password'],
	[confirm_password => 'Re-enter Password'],
	[display_name => 'Your Full Name'],
	[UserLoginForm => [
	    ok_button => 'Login',
	]],
	[first_name => 'First Name'],
	[middle_name => 'Middle Name'],
	[street1 => 'Street Line 1'],
	[street2 => 'Street Line 2'],
	[city => 'City'],
	[state => 'State'],
	[zip => 'Zip'],
	[country => 'Country'],
	[UserCreateForm => [
	    ok_button => 'Register',
	]],
	map({
	    my($t, $v) = @$_;
	    map(["$_->[0].$t" => $_->[1]], @$v);
	}
	    [field_description => [
		['UserCreateForm.confirm_password' => q{Enter your password again.}],
	    ]],
	),
	[base_title => [
	    LOGIN => 'Login',
	    USER_CREATE => 'Register',
	    SITE_ROOT => '',
	]],
	[link => [
	    LOGIN => 'Already registered?  Click here to login.',
	    USER_CREATE => 'Not registered? Click here to register.',
	]],
	[separator => [
	    address => 'Address (optional)',
	]],
    ],
});

1;
