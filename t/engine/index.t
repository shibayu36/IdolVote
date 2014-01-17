package t::IdolVote::Engine::Index;

use strict;
use warnings;
use utf8;
use lib 't/lib';

use parent 'Test::Class';

use Test::IdolVote;
use Test::IdolVote::Mechanize;

sub _get : Test(3) {
    my $mech = create_mech;
    $mech->get_ok('/');
    $mech->title_is('IdolVote');
    $mech->content_contains('IdolVote');
}

__PACKAGE__->runtests;

1;
