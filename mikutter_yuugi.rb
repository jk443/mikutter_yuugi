# -*- coding: utf-8 -*-

Plugin.create(:mikutter_yuugi) do
  command(
          :mikutter_yuugi,
          name: '遊戯王',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    to_name = opt.messages[0].user.idname
    words = ["サッカー部員達", "後輩", "三浦", "谷岡","TDN", "GO",
             "マジメ君", "DB", "HTN", "TNOK", "野獣先輩",
             "ドラゴン田中", "ヒゲクマ調教師", "課長", "現場監督",
             "敏感ふとまら君", "淫乱テディベア", "うま味紳士",
             "ひで",  "虐待おじさん", "KBTIT", "平野源五郎",
             "たると", "まひろ", "じゅんぺい"]
    msg = ["お願い、死なないで@"+ to_name +"！あんたが今ここで倒れたら、"+words.sample+"との約束はどうなっちゃうの？ ライフはまだ残ってる。これを耐えれば、"+words.sample+"に勝てるんだから！次回、「"+to_name+"死す」。デュエルスタンバイ！"]
    to = "@"+to_name + " "
    Service.primary.post(:message => msg,
                         :replyto => opt.messages[0])
  end
end
