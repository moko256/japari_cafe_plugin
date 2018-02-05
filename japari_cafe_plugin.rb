# -*- coding: utf-8 -*-

Plugin.create(:japari_cafe_plugin) do
  command(:jaoari_cafe_plugin,
    name: 'ジャパリカフェPlugin',
    description: 'ふわああぁ！いらっしゃぁい！よぉこそぉ↑mikutterへ～！どうぞどうぞ！ゆっぐりしてってぇ！いやま゛っ↓てたよぉ！やっとユーザーさんが来てくれたゆぉ！嬉しいなあ！ねえなんにぃ投稿するぅ？色々あるよぉ、これね、ツイートって言うんだってぇハ↓カセに教えてもらったンの！',
    condition: lambda { |opt| true },
    visible: true,
    role: :timeline
  ) do |opt|
    dialog = Gtk::Dialog.new('ジャパリカフェ',
      $main_application_window,
      Gtk::Dialog::DESTROY_WITH_PARENT,
      [Gtk::Stock::CANCEL,Gtk::Dialog::RESPONSE_CANCEL],
      [Gtk::Stock::OK,Gtk::Dialog::RESPONSE_OK]
    )
    dialog.vbox.add(Gtk::Label.new('ふわああぁ！いらっしゃぁい！よぉこそぉ↑'))

    where = Gtk::Entry.new()
    where.text = 'mikutter'
    dialog.vbox.add(where)

    dialog.vbox.add(Gtk::Label.new('へ～！どうぞどうぞ！ゆっぐりしてってぇ！いやま゛っ↓てたよぉ！やっと'))

    who = Gtk::Entry.new()
    who.text = 'ユーザーさん'
    dialog.vbox.add(who)

    dialog.vbox.add(Gtk::Label.new('が来てくれたゆぉ！嬉しいなあ！ねえなんにぃ'))

    what = Gtk::Entry.new()
    what.text = '投稿す'
    dialog.vbox.add(what)

    dialog.vbox.add(Gtk::Label.new('るぅ？色々あるよぉ、これね、'))

    drink = Gtk::Entry.new()
    drink.text = 'ツイート'
    dialog.vbox.add(drink)

    dialog.vbox.add(Gtk::Label.new('って言うんだってぇハ↓カセに教えてもらったンの！'))

    dialog.show_all
    if dialog.run == Gtk::Dialog::RESPONSE_OK
      text = "ふわああぁ！いらっしゃぁい！よぉこそぉ↑#{where.text}へ～！どうぞどうぞ！ゆっぐりしてってぇ！いやま゛っ↓てたよぉ！やっと#{who.text}が来てくれたゆぉ！嬉しいなあ！ねえなんにぃ#{what.text}るぅ？色々あるよぉ、これね、#{drink.text}って言うんだってぇハ↓カセに教えてもらったンの！"
      if Gtk::Dialog::confirm(text)
        world, = Plugin.filtering(:world_current, nil)
        compose(world, body: text)
      end
    end
    dialog.destroy
  end
end
