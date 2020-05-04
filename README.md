# 競プロアプリ
競技プログラミングで使用するデータ構造・アルゴリズムを記事や問題にしてまとめたアプリです。
ユーザー登録をしたら、記事や問題の閲覧/作成/編集/削除等ができます。

# 環境
- Ruby 2.6.2
- Ruby on Rails 5.2.4.2
- bundler 1.17.2
- rbenv 1.1.2
- mysql 8.0.19

# セットアップ
- ソースコードをクローンする
````
$ git clone https://github.com/Takumi1122/kyopro_app.git
````
- Rubyのバージョンを合わせる
````
$ rbenv versions
  system
  * 2.6.2 (set by /Users/owner/kyopro_app/.ruby-version)
````
- Ruby 2.6.2がrbenvになかったら、インストールを行う
````
$ rbenv install 2.6.2
````
- インストールが完了したら、バージョンを2.6.2に切り替える
````
$ rbenv global 2.6.2
````
- bundlerをインストールしていない場合はインストールする
````
$ gem install bundler
````
- インストールが完了したら、bundlerを実行してライブラリをインストールする
````
$ bundle install
````
※ bundlerを実行した際にmysql２に関するエラーが起きる場合がある。エラーが発生したら、次のリンクを参考にエラーを解決する
[mysql2 gemインストール時のトラブルシュート](https://qiita.com/HrsUed/items/ca2e0aee6a2402571cf6)

- データベースの作成、マイグレーション、seedの実行を行う
````
$ bin/rails db:create
$ bin/rails db:migrate
$ bin/rails db:seed
````
- railsサーバーを起動させる
````
$ bin/rails s
````

# ライセンス
This software is released under the MIT License.

# 参考書籍/サイト
[現場で使える Ruby on Rails 5速習実践ガイド](https://book.mynavi.jp/ec/products/detail/id=93905)