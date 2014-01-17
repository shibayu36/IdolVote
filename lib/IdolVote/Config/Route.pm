package IdolVote::Config::Route;

use strict;
use warnings;
use utf8;

use Router::Simple::Declare;

sub make_router {
    return router {
        connect '/' => {
            engine => 'Index',
            action => 'default',
        };
        connect '/songs' => {
            engine => 'Songs',
            aciton => 'default',
        };
        connect '/song/:name' => {
            engine => 'Songs',
            action => 'song',
        } => { method => 'GET' };

        connect '/song/:name' => {
            engine => 'Songs',
            action => 'vote_song',
        } => { method => 'POST' };
    };
}

1;
