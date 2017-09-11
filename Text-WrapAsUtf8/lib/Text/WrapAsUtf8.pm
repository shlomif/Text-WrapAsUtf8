package Text::WrapAsUtf8;

use strict;
use warnings;

our $VERSION = '0.0.1';

use parent 'Exporter';

our @EXPORT_OK = (qw(print_utf8 wrap_as_utf8));

sub wrap_as_utf8
{
    my ($cb) = @_;

    binmode STDOUT, ":encoding(UTF-8)";

    $cb->();

    binmode STDOUT, ":raw";

    return;
}

sub print_utf8
{
    my (@data) = @_;

    wrap_as_utf8(
        sub {
            print @data;

            return;
        }
    );

    return;
}

1;

__END__

=head1 NAME

Text::WrapAsUtf8 - temporarily wraps output to stdout as the UTF-8 binmode.

=head1 VERSION

=head1 EXPORTS

=head2 wrap_as_utf8(sub { print ... });

Sets the STDOUT binmode to UTF-8, calls the subroutine that is passed as an
argument, and sets binmode to raw.

=head2 print_utf8(@strings)

Prints @strings while inside wrap_as_utf8().

=cut
