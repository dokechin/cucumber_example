#language: ja
フィーチャ: 飼育計画
  牛を飼育するための計画。

  シナリオ: 牛を飼育する
    前提<  体重"<体重>"kgの牛
    もし<  飼料の必要量を計算する
    ならば<   カロリー"<カロリー>"MJ
    かつ<   タンパク"<タンパク>"kg
    例:
         |体重|カロリー|タンパク|
         |450|26500|215|
         |500|29500|245|

