package Text::WrapAsUtf8;

use strict;
use warnings;

use parent 'Exporter';

our @EXPORT_OK = (
    qw(
        print_utf8
        wrap_as_utf8
        )
);

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

=head1 SYNOPSIS

    use Text::WrapAsUtf8 qw/ print_utf8 wrap_as_utf8 /;

    print_utf8("Hello\n", "World\n");

    wrap_as_utf8(sub {
        print("string containing unicode\n");
    });

=head1 DESCRIPTION

This module implements two functions that proved of utility in my Website
Meta Language
(L<http://www.shlomifish.org/open-source/projects/website-meta-language/>)
sites and which I decided to extract into a common CPAN distribution. They
temporarily wrap output to STDOUT in the UTF-8 encoding layer.

=head1 VERSION

=head1 EXPORTS

=head2 wrap_as_utf8(sub { print ... });

Sets the STDOUT binmode to UTF-8, calls the subroutine that is passed as an
argument, and sets binmode to raw.

=head2 print_utf8(@strings)

Prints @strings while inside wrap_as_utf8().

=cut
