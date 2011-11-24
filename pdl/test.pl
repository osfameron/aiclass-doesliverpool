use strict; use warnings;
use feature 'say';
use Data::Dumper;
use WordNet::BestStem 'deluxe_stems';

use PDL::LiteF;
use PDL::Stats;

my @phrases = grep $_, split /\n/, <<LIST;
The hotel was good.
The hotel was very good.
Roses are red.
Buses are red.
LIST

my $matrix = pdl get_bayes(\@phrases);

sub get_bayes {
    my $phrases = shift;
    my @words;

    return [
        map {
            my $phrase = $_;

            my %words;
            my @phrase = split /\s+/, $phrase;
            my $stemmed = deluxe_stems \@phrase;

            my @tokens = map 
                normalize($_),
                @$stemmed;
            for my $token (@tokens) {
                $words{$token}++
                    or push @words, $token;
            }
            [ map $words{$_}, @words ];
        } @phrases,
    ];
}

sub normalize {
    my $word = shift;

    $word = lc $word;
    $word =~tr/a-z//cd;

    return if $word ~~ [qw/ a an i the in at of be /]; # stopwords

    return $word;
}

for (2) {
    say '';
    say "################ $_";
    say '';

    my %result = $matrix->transpose->kmeans( { NCLUS => $_ } );
    my $cluster = $result{cluster};
    my ($words, $clusters) = $cluster->dims;


    for my $c (0.. ($clusters-1) ) {
        my @indexes = grep $_,
            ($cluster->slice(",$c") * sequence( $words ))->list;
        say "------------";
        say join "\n", @phrases[ @indexes ];
    }

}
