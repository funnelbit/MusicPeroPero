package MusicPeroPero::Setting;
use parent MusicPeroPero;

sub new {
    my $class = shift;
    return bless {
        irc_user_name => '', # 自分の名前入れてください
        irc_address   => '', # 接続するサーバ入れてください
        irc_port      => '', # 接続に使うポート入れてください
        irc_password  => '', # パスワードある場合は入れてください
        irc_ssl       => 0, # ssl接続の場合は1にしてください
        irc_channel   => '#MusicPeroPero', # 他のチャンネルが良い場合は変えてください
        irc_barrier   => 0, #相手からの操作を全て無効にしたい場合は1にしてください
    }, $class;
}

1;
