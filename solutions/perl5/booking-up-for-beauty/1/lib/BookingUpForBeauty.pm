package BookingUpForBeauty;

use v5.40;

# Suggested datetime modules you can use:
use Time::Piece;
# use DateTime::Tiny;

# Recommended, commented out for portability.
use Const::Fast;

use Exporter ('import');
our @EXPORT_OK = ('appointment_has_passed', 'is_afternoon_appointment', 'describe_appointment');

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';
# const $STRPTIME_FORMAT => $STRPTIME_FORMAT;

# Private subroutines conventionally start with an underscore.
# It isn't necessary, but provided for convenience.
sub _parse_datetime ($date_string) {
    my $t = Time::Piece->strptime($date_string, $STRPTIME_FORMAT);
    return $t;
}

sub appointment_has_passed ($date_string) {
    my $t = _parse_datetime($date_string);
    my $now = Time::Piece->new();
    if ($t < $now ) {
        return true;
    }
    else {
        return false;
    }
}

sub is_afternoon_appointment ($date_string) {
    my $t = _parse_datetime($date_string);
    return $t->hour >= 12 && $t->hour < 18;
}

sub describe_appointment ($date_string) {
    my $t = _parse_datetime($date_string);
    my $hour_12 = $t->hour % 12;
    $hour_12 = 12 if $hour_12 == 0;
    return sprintf('You have an appointment on %02d/%02d/%04d %d:%02d %s', $t->mon, $t->mday, $t->year, $hour_12, $t->min, $t->hour >= 12 ? 'PM' : 'AM');
}

1;
