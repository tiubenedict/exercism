package Gigasecond;

use v5.40;

use Time::Piece;

use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;

sub add_gigasecond ($time) {
    my $t = Time::Piece->strptime($time, '%Y-%m-%dT%H:%M:%S');
    $t += 1_000_000_000;
    return $t->strftime('%Y-%m-%dT%H:%M:%S');
}

1;
