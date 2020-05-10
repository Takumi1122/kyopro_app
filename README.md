# 競プロアプリ
競技プログラミングで使用するデータ構造・アルゴリズムを記事や問題にしてまとめたアプリです。
ユーザー登録をしたら、記事や問題の閲覧/作成/編集/削除等ができます。
|画面|画面|
|---|---|
|![kyopro_index](https://user-images.githubusercontent.com/42643926/81492652-8b89b000-92d4-11ea-8339-5476d3f1e66a.png)|![kyopro_article_show](https://user-images.githubusercontent.com/42643926/81492662-a0feda00-92d4-11ea-8bbc-fd2053f530a1.png)|
|![kyopro_app_problems](https://user-images.githubusercontent.com/42643926/81492664-a4926100-92d4-11ea-9a58-00535027add8.png)|![kyopro_app_new_article](https://user-images.githubusercontent.com/42643926/81492667-a9571500-92d4-11ea-871b-da6e2b11bc10.png)|
|![kyopro_app_problem_show](https://user-images.githubusercontent.com/42643926/81492680-c1c72f80-92d4-11ea-84e9-aa6007e1a01a.png)|![kyopro_app_new_problem](https://user-images.githubusercontent.com/42643926/81492681-c4298980-92d4-11ea-8562-a6f1532e8987.png)|
# 機能一覧
- ユーザーの登録/ログイン/ログアウト
- 記事の登録/編集/閲覧/削除 (markdownが使える)
- 問題の登録/編集/閲覧/削除
- 問題の検索(タイトル・登録日時・関連記事で検索可能)

# 環境
- macOS Catalina 10.15.4
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
- mysqlにkyopro_dumpをインポートする
````
$ mysql -u ユーザー名 -p データベース名 < kyopro_dump
````
- railsサーバーを起動させる
````
$ bin/rails s
````

# ライセンス
This software is released under the MIT License.

# 参考書籍/サイト
[現場で使える Ruby on Rails 5速習実践ガイド](https://book.mynavi.jp/ec/products/detail/id=93905)
