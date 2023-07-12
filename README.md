メモ用
api使ったことないので色々試し中
connpassのapiを今使ってなんかしてます

connpassapiのリファレンスサイト
https://connpass.com/about/api/

query_params[:event_id] = params[:event_id] if param[:event_id].present?
はこれだったらevent_idというパラメータがあったらurlの後ろについてた時に表示されるみたいな?これ無くて,区切りでやると両方無いと表示されないと思う。

今直接打ち込んで表示してる(JSONデータ見れるだけ)から、フロント側で送ってきたデータをどういう風に反映させるのかが分からないので調べ中...
↑これrender plain: @events.to_sがプレーンテキスト(文字とかフォーマットがないやつ)で表示してる(htmlがない)からJSONだけ見えてるっぽい？html用意してなんかしてみる
        
