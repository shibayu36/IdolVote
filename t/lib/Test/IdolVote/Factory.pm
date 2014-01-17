package Test::IdolVote::Factory;

use strict;
use warnings;
use utf8;

use Exporter::Lite;
our @EXPORT = qw(
    create_user
);

use DateTime;
use DateTime::Format::MySQL;
use String::Random qw(random_regex);

use IdolVote::DBI::Factory;

# ランダムなユーザを作成する
sub create_user (%) {
    my (%args) = @_;
    my $name    = $args{name} // random_regex('\w{30}');
    my $created = $args{created} // DateTime->now;

    my $dbh = IdolVote::DBI::Factory->new->dbh('idolvote');

    $dbh->query(q[
        INSERT INTO user
          SET name = :name,
              created = :created
    ], {
        name    => $name,
        created => DateTime::Format::MySQL->format_datetime($created),
    });

    return $dbh->select_row_as(q[
        SELECT * FROM user
          WHERE name = :name
    ], {
        name => $name
    }, "IdolVote::Model::User");
}

1;
