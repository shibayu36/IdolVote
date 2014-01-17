package t::IdolVote::DBI::Factory;
use strict;
use warnings;
use utf8;

use lib 't/lib';

use parent 'Test::Class';

use Test::More;

use Test::IdolVote;

use IdolVote::DBI::Factory;

sub _use : Test(1) {
    use_ok 'IdolVote::DBI::Factory';
}

sub _dbconfig : Test(3) {
    my $dbfactory = IdolVote::DBI::Factory->new;
    my $db_config = $dbfactory->dbconfig('idolvote');
    is $db_config->{user}, 'idolvote';
    is $db_config->{password}, 'idolvote';
    is $db_config->{dsn}, 'dbi:mysql:dbname=idolvote_test;host=localhost';
}

sub _dbh : Test(1) {
    my $dbfactory = IdolVote::DBI::Factory->new;
    my $dbh = $dbfactory->dbh('idolvote');
    ok $dbh;

}

__PACKAGE__->runtests;

1;
