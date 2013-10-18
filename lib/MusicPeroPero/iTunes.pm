package MusicPeroPero::iTunes;
use parent MusicPeroPero;
use Mac::iTunes;
use AnyEvent;

sub new {
    my $class = shift;

    return bless { _track_info => {} }, $class;
}

sub get_now_track {
    my $self = shift;
    my $track = $self->{_track_info};

    return "🎵$track->{name} - $track->{artist} - $track->{album}";
}

sub _get_new_track_info {
    my $track_info = {
        name => "",
        artist => "",
    };

    return unless length Mac::iTunes->controller->current_track_name;

    $track_info->{name}   = Mac::iTunes->controller->current_track_name;
    $track_info->{artist} = Mac::iTunes->controller->tell('
        tell application "iTunes"
        set hoge to artist of current track
            return hoge
        end tell');
    $track_info->{album} = Mac::iTunes->controller->tell('
        tell application "iTunes"
        set hoge to album of current track
            return hoge
        end tell');

    return $track_info;
}

sub _set_new_track_info {
    my ($self, $getted_new_track_info) = @_;

    return 0 if $self->{_track_info}->{name} eq $getted_new_track_info->{name};

    $self->{_track_info} = $getted_new_track_info;
}

sub start_watch {
    my ($self, $callback) = @_;
    my $timer = AnyEvent->timer(
        after    => 1, # 秒間まってからループ開始
        interval => 2, # 秒数ごとにやる
        cb       => sub {
            return unless Mac::iTunes->controller->state eq 'playing';
            return unless _set_new_track_info($self, _get_new_track_info );
            $callback->(get_now_track($self));
        }
    );

    AnyEvent->condvar->recv;
}


1;
