use strict; use warnings;
use WordNet::BestStem qw( deluxe_stems );
use feature 'say';
use Data::Dumper;

my $stemmed_text = deluxe_stems [ split /\s+/, <<TEXT ];
the Books You've Been Planning To Read For Ages,
the Books You've Been Hunting For Years Without Success,
the Books Dealing With Something You're Working On At The Moment,
the Books You Want To Own So They'll Be Handy Just In Case,
the Books You Could Put Aside Maybe To Read This Summer,
the Books You Need To Go With Other Books On Your Shelves,
the Books That Fill You With Sudden, Inexplicable Curiosity, Not Easily Justified.
TEXT

say join ' ' => @$stemmed_text;
