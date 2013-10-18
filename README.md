MusicPeroPero
=============

あのチャンネルで聴いてる

- できること
    - IRCで今聴いている音楽のタイトルを垂れ流します
    - IRCでiTunesをリモートコントロールできます
- 使い方
    - `まず，MusicPeroPero/Setting.pm`にIRCに接続するための設定を書いて下さい．
        - irc_user_name => '', # 自分の名前入れてください
        - irc_address   => '', # 接続するサーバ入れてください
        - irc_port      => '', # 接続に使うポート入れてください
        - irc_password  => '', # パスワードある場合は入れてください
        - irc_ssl       => 0, # ssl接続の場合は1にしてください
        - irc_channel   => '#MusicPeroPero', # 他のチャンネルが良い場合は変えてください
        - irc_barrier   => 0, #相手からの操作を全て無効にしたい場合は1にしてください
    - perl MusicPeroPero.plで実行します．モジュールない場合は適当に入れてください．
- コマンド
    - コマンドで指定したユーザ名のiTunesを操作できます．
        - ユーザ名.play ......指定したユーザの音楽を再生させます
        - ユーザ名.pause .....指定したユーザの音楽を一時停止します
        - ユーザ名.stop ......指定したユーザの音楽を停止します
        - ユーザ名.next ......指定したユーザの音楽を，次の音楽に切り替えます
        - ユーザ名.prev ......指定したユーザの音楽を，前の音楽に切り替えます
        - ユーザ名.rewind ....指定したユーザの音楽を，再生が終了するまで逆再生します
        - ユーザ名.quit ......指定したユーザのiTunesを終了させます
        - ユーザ名.destory ...指定したユーザの耳にダメージを与えます
        - ユーザ名.kanna .....指定したユーザのPCに谷川柑菜を表示させます
        - ユーザ名.vi ........指定したユーザのPCでviを起動します

    - 例えば，iTunes-experoperoというユーザがいたら，`experopero.destory`とすると，experoperoの耳にダメージを与えます．
