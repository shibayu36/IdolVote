package IdolVote::Config;

use strict;
use warnings;
use utf8;

use IdolVote::Config::Route;

use Config::ENV 'IDOLVOTE_ENV', export => 'config';
use Path::Class qw(file);

my $Router = IdolVote::Config::Route->make_router;
my $Root = file(__FILE__)->dir->parent->parent->parent->absolute;

sub router { $Router }
sub root { $Root }

common {
};

$ENV{SERVER_PORT} ||= 3000;
config default => {
    origin => "http://localhost:$ENV{SERVER_PORT}",
};

config production => {
};

config local => {
    parent('default'),
    db => {
        idolvote => {
            user     => 'root',
            password => '',
            dsn      => 'dbi:mysql:dbname=idolvote;host=localhost',
        },
    },
    db_timezone => 'UTC',
};

config test => {
    parent('default'),

    db => {
        idolvote => {
            user     => 'root',
            password => '',
            dsn      => 'dbi:mysql:dbname=idolvote_test;host=localhost',
        },
    },
    db_timezone => 'UTC',
};

1;
