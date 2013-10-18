package MusicPeroPero::iTunes::Remocon;
use parent MusicPeroPero::iTunes;

sub new {
    my $class = shift;
    return bless { }, $class;
}

sub play {
    my $self = shift;
    Mac::iTunes->controller->play;
}

sub pause {
    my $self = shift;
    Mac::iTunes->controller->pause;
}

sub stop {
    my $self = shift;
    Mac::iTunes->controller->stop;
}

sub next {
    my $self = shift;
    Mac::iTunes->controller->next;
}

sub pervios {
    my $self = shift;
    Mac::iTunes->controller->pervios;
}

sub rewind {
    my $self = shift;
    Mac::iTunes->controller->rewind;
}

sub quit {
    my $self = shift;
    Mac::iTunes->controller->quit;
}

sub destroy {
    my $self = shift;
    Mac::iTunes->controller->tell('
        tell application "iTunes"
            set sound volume to 100
        end tell
        set volume 100
    ');
}

sub kanna {
    my $self = shift;
    system("/usr/bin/open -a '/Applications/Google Chrome.app' 'http://www.ichika-ichika.com/character.html#h-3'");
}

sub vi {
    my $self = shift;
    return system("vi");
}

1;
