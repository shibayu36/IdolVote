package IdolVote::Engine::Ranking;

use strict;
use warnings;
use utf8;

use IdolVote::Songs;

sub default {
    my ($class, $c) = @_;
    my $songs = IdolVote::Songs->songs;
    my $ranking = [
        sort {
            $b->{vote} <=> $a->{vote};
        }
        grep {
            warn Dumper($_);
            !! $_->{vote};
        }
        map {
            IdolVote::Songs->song($_);
        } @$songs,
    ];

    $c->html('ranking.html', {
        ranking => $ranking,
    });

}

!!1;
