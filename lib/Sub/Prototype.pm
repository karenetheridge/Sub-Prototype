use strict;
use warnings;

package Sub::Prototype;
# ABSTRACT: Set a sub's prototype

require 5.008001;

use XSLoader;

our $VERSION = '0.03';

XSLoader::load(__PACKAGE__, $VERSION);

use Sub::Exporter -setup => {
    exports => ['set_prototype'],
    groups  => { default => ['set_prototype'] },
};

1;

__END__

=pod

=head1 SYNOPSIS

    use Sub::Prototype;

    BEGIN {
        my $code = sub { ... };
        set_prototype($code, '&@');
        *main::my_func = $code;
    }

    my_func { ... } @list;

=head1 FUNCTIONS

This module only has one function, which is also exported by default:

=head2 set_prototype(\&coderef, $prototype)

    set_prototype(\&some_function, '$$');

Sets the prototype for C<coderef> to C<$prototype>.

=head1 THANKS

Shawn M Moore for the idea and tests.

=cut
