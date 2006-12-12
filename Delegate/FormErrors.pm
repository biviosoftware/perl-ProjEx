# Copyright (c) COPYRIGHT-YEAR COPYRIGHT-HOLDER  All rights reserved.
# $Id$
package ProjEx::Delegate::FormErrors;
use strict;
use base ('Bivio::Delegate::SimpleFormErrors');

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub get_delegate_info {
    my($proto) = @_;
    return \(<<'EOF' . ${shift->SUPER::get_delegate_info(@_)});
UserLoginForm
RealmOwner.password
PASSWORD_MISMATCH
The password you entered does not match the value stored
in our database.
Please remember that passwords are case-sensitive, i.e.
"HELLO" is not the same as "hello".
%%
EOF
};

1;
