#!/usr/bin/perl

use strict; use warnings;
use File::Slurp;
use Data::Dumper;
use feature 'say';

my @lines = read_file(shift);
my @words = map { split /\s+/ } @lines;

my %hash;

for my $word (@words) {
    $word = normalize($word) or next;
    $hash{$word} ++;
}

sub normalize {
    my $word = shift;
    return if $word=~/^#/;
    return 'sport' if $word eq 'sports';
    return $word; # TODO
}

say Dumper(\%hash);
say scalar keys %hash;

