package IdolVote::Model::User;

use strict;
use warnings;
use utf8;

use Class::Accessor::Lite (
    ro => [qw(
        user_id
        name
    )],
    new => 1,
);

use IdolVote::Util;

sub created {
    my ($self) = @_;
    $self->{_created} ||= eval {
        IdolVote::Util::datetime_from_db($self->{created});
    };
}

1;
