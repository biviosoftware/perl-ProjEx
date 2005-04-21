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
    Color => {
	initialize => sub {
	    my($fc) = @_;
	    $fc->group(page_link => -1);
	    $fc->group(['page_vlink', 'page_alink'] => -1);
            $fc->group(page_link_hover => -1);
	    $fc->group(page_text => 0);
	    $fc->group(page_bg => 0xFFFFFF);
	    $fc->group(page_heading => -1);
	    $fc->group(error => 0x990000);
            $fc->group(warning => 0x990001);
	    $fc->group(table_heading => -1);
            $fc->group(table_even_row_bg => 0xF3F3F3);
	    $fc->group(table_odd_row_bg => -1);
	    $fc->group(table_separator => 0);
            $fc->group(summary_line => 0x66CC66);
	    return;
	},
    },
    Font => {
	initialize => sub {
	    my($fc) = @_;
	    $fc->group(default => [
		'family=verdana,arial,helvetica,geneva,sunsans-regular,sans-serif',
		'size=small',
	    ]);
	    $fc->group(error => ['color=error', 'bold']);
	    $fc->group(form_field_error => ['color=error', 'smaller', 'bold']);
	    $fc->group(form_field_error_label => ['color=error', 'italic']);
	    $fc->group(page_heading => ['bold']);
	    $fc->group(table_heading => ['color=table_heading', 'bold']);
	    $fc->group(warning => ['color=warning', 'bold']);
	    $fc->group([qw(
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
            )] => []);

	    # Add your own here
	    $fc->group(hello => ['class=hello']);
	    return;
	}
    },
    Text => {
	initialize => sub {
	    my($fc) = @_;
	    $fc->group(support_email => 'support@'
		. $fc->get_facade->get('mail_host'));
#TODO:	    $fc->group(support_phone => '(800) 555-1212');
	    $fc->group(site_name => q{COPYRIGHT-HOLDER});
	    $fc->group(home_page_uri => '/hm/index');
	    $fc->group(view_execute_uri_prefix => 'site_root/');
	    $fc->group(favicon_uri => '/i/favicon.ico');
	    $fc->group(none => '');
	    $fc->group(Image_alt => [
		dot => '',
		bivio_power => 'Operated by bivio Software, Inc.',
	    ]);
	    $fc->group(ok_button => '   OK   ');
	    $fc->group(cancel_button => ' Cancel ');
	    return;
	},
    },
    Task => {
	initialize => sub {
	    my($fc) = @_;
	    $fc->group(CLUB_HOME => '?');
	    $fc->group(DEFAULT_ERROR_REDIRECT_FORBIDDEN => undef);
	    $fc->group(FAVICON_ICO => '/favicon.ico');
	    $fc->group(FORBIDDEN => undef);
	    $fc->group(LOCAL_FILE_PLAIN => ['/i/*']);
	    $fc->group(LOGIN => undef);
#TODO:	    $fc->group(LOGOUT => 'pub/logout');
	    $fc->group(MY_SITE => undef);
	    $fc->group(MY_CLUB_SITE => undef);
	    $fc->group(SHELL_UTIL => undef);
	    $fc->group(SITE_ROOT => '/*');
	    $fc->group(USER_HOME => '?');
	    return;
	},
    },
    HTML => {
	initialize => sub {
	    my($fc) = @_;
	    $fc->group(want_secure => 0);
	    $fc->group(table_default_align => 'left');
	    return;
	},
    },
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
