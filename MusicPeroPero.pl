#!/usr/bin/env perl
# あ　の　チ　ャ　ン　ネ　ル　で　聴　い　て　る
use strict;
use warnings;
use FindBin::libs;

use MusicPeroPero::Help;
use MusicPeroPero::Setting;
use MusicPeroPero::Irc;
use MusicPeroPero::iTunes;
use MusicPeroPero::iTunes::Remocon;

MusicPeroPero::Help->show;

my $settings = MusicPeroPero::Setting->new;
my $iTunes = MusicPeroPero::iTunes->new;
my $iTunesRemocon = MusicPeroPero::iTunes::Remocon->new;
my $irc = MusicPeroPero::Irc->new($settings);
$irc->set_recive_event( sub {
        my ($chan, $msg) = @_;
        return if $settings->{irc_barrier};
        return unless $msg =~ /$settings->{irc_user_name}\./i;
        $iTunesRemocon->$' if $iTunesRemocon->can($');
    }
);
$irc->connect;
$iTunes->start_watch( sub {
        my $playing_song_name = shift;
        $irc->send( $playing_song_name );
        warn $playing_song_name;
} );
