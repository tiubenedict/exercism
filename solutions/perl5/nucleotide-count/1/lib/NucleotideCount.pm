package NucleotideCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_nucleotides>;

sub count_nucleotides ($strand) {
    my %counts = ( A => 0, C => 0, G => 0, T => 0 );
    foreach my $nucleotide (split //, $strand) {
        if (exists $counts{$nucleotide}) {
            $counts{$nucleotide}++;
        } else {
            die "Invalid nucleotide in strand";
        }
    }
    return \%counts;
}

1;
