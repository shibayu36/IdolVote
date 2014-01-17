package t::IdolVote::DBI;

use strict;
use warnings;
use utf8;
use lib 't/lib';

use parent 'Test::Class';

use Test::IdolVote;
use Test::More;

sub _use : Test(1) {
    use_ok 'IdolVote::DBI';
}

__PACKAGE__->runtests;

1;
