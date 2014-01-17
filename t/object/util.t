package t::IdolVote::DBI::Factory;

use strict;
use warnings;
use utf8;
use lib 't/lib';

use parent 'Test::Class';

use Test::More;

use Test::IdolVote;

use IdolVote::Util;

sub _use : Test(1) {
    use_ok 'IdolVote::Util';
}

__PACKAGE__->runtests;

1;
