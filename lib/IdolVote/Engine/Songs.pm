package IdolVote::Engine::Songs;

use strict;
use warnings;
use utf8;

use IdolVote::Songs;

sub default {
    my ($class, $c) = @_;
    my $songs = IdolVote::Songs->songs;
    $c->html('songs.html', {
        songs => $songs,
    });
}

sub song {
    my ($class, $c) = @_;
    my $song = IdolVote::Songs->song($c->req->parameters->{name});
    $c->html('song.html', {
        song => $song,
    });
}

sub vote_song {
    my ($class, $c) = @_;
    IdolVote::Songs->vote(
        $c->req->parameters->{name},
        $c->req->parameters->{serial},
    );
    return $c->redirect('/songs');
}

1;
__END__
