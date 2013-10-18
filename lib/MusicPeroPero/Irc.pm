package MusicPeroPero::Irc;
use parent MusicPeroPero;
use AnyEvent::IRC::Client;

sub new {
    my ($class, $settings) = @_;
    my $irc = new AnyEvent::IRC::Client;

    $irc->reg_cb( connect    => sub { print "connected\n"; } );
    $irc->reg_cb( registered => sub { print "registered\n"; } );
    $irc->reg_cb( disconnect => sub { print "disconnet\n"; } );

    return bless {
        irc     => $irc,
        task    => [],
        settings => $settings,
    }, $class;
}

sub set_recive_event {
    my ($self, $task) = @_;
    push ($self->{task}, $task);
}

sub send {
    my ($self, $message) = @_;
    my $settings = $self->{settings};

    $self->{irc}->send_chan(
        $self->{settings}->{irc_channel},
        "NOTICE",
        $self->{settings}->{irc_channel},
        $message,
    );
}

sub connect {
    my $self = shift;
    my $settings = $self->{settings};

    $self->{irc}->enable_ssl if $settings->{irc_ssl};
    $self->{irc}->connect(
        $settings->{irc_address},
        $settings->{irc_port},
        {
            nick     => "iTunes-$settings->{irc_user_name}",
            password => $settings->{irc_password},
        }
    );
    $self->{irc}->send_srv( "JOIN", $settings->{irc_channel} );
    $self->{irc}->reg_cb(
        publicmsg => sub {
            my ( $irc, $chan, $msg ) = @_;
            my $message = $msg->{params}->[1];

            for (@{$self->{task}}) {
                $_->( $chan, $message );
            }
        }
    );
}

1;
