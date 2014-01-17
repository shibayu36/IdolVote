package t::IdolVote::Engine::User;

use strict;
use warnings;
use utf8;
use lib 't/lib';

use parent 'Test::Class';

use Test::IdolVote;
use Test::IdolVote::Mechanize;
use Test::IdolVote::Factory;

use Test::More;

sub _list : Test(1) {
    my $user = create_user;

    subtest 'ユーザのリストに作成したユーザ名が含まれるか' => sub {
        my $mech = create_mech;
        $mech->get_ok('/user/list');
        $mech->content_contains($user->name);
    };
}

__PACKAGE__->runtests;

1;
