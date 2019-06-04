# これは何？
社員研修用に利用する、freemarket_sampleのフロントのみ実装したものです。

# どうやって使うの？

## 1. Githubからダウンロードする
上の方にボタンがあるので、ダウンロードしてください。クローンしないのは、誤ってプッシュしてこのリポジトリが変更されることを防ぐためです。

## 2. 自分のPC上でダウンロードして来たzipを解凍
ここで、Rubyのバージョンを2.5.1に変更してください。なければrbenvを利用して2.5.1をインストールしてください。
また、`bundle install`もしておきましょう。

## 3. データベースの準備
以下のコマンドで、データベースを準備します。この時、database.ymlを編集してデータベースの名前を変更しても構いません。

rails db:create
rails db:migrate

この時DB名は各々決めて良い事とする

## 4.ユーザー作成
users/sign_up にアクセスし、一人ユーザーを作成してください。

## 5.閲覧できるページの確認
以下のページにアクセス可能です。一度確認してください。
* top(/)
* user:show(/users/1)
* product:show(/products/1)
* product:new(/products/new)
# freemarket_sample_frontonly
