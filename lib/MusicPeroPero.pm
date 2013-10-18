package MusicPeroPero;
use strict;
use warnings;
use AnyEvent;

sub new {
    my $class = shift;

    return bless {}, $class;
}

1;
