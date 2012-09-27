# todo_manager2

* todo_manager 同様、[backbone.js の example](https://github.com/documentcloud/backbone/tree/master/examples) にある TODO アプリ todos のバックエンドに Rails を使用し、ストレージを MySQL にしました。
* ルーター、コレクションなどの役割ごとに、ディレクトリ、ファイルを分割しました。backbone-on-rails gem を導入しました。

## backbone-on-rails gem でひな形の生成

backbone-on-rails gem で scaffold できました。

```
rails g backbone:install --javascript
rails g backbone:scaffold todo --javascript

      create  app/assets/javascripts/models/todo.js
      create  app/assets/javascripts/collections/todos.js
      create  app/assets/javascripts/routers/todos.js
      create  app/assets/javascripts/views/todos
      create  app/assets/javascripts/views/todos/index.js
      create  app/assets/templates/todos
      create  app/assets/templates/todos/index.jst.ejs
```

## _.template ではなく JST

* todo_manager では、erb ファイルのなかに、underscore.js のテンプレートを書きこんでいました。本アプリでは、JST を導入し、JS 側で構築するテンプレートを app/assets/templates 以下に *.jst.ejs として分離しました。
* *.jst.ejs として erb ファイルから切り出すことで、<% などの競合を避けることができました。
* *.jst.ejs として erb ファイルから切り出すことで、コレクションやモデルの定義の実行を DOM の構築を意識せずに行えるようになりました。

## todo_manager.js

* todo_manager.js というブートストラップファイルでは、名前空間の作成と、ルーター（とそのためのコレクション）インスタンスの生成のみを行いました。ここにもっといろいろ処理を書いても動きそうですが、ヨソで書ける内容は避けました。

## 所感

けっこう考え込んだり、書き直したりしました。最初の頃は、今回は JS が担当するルートが１つ(index)のみということで、ルーターの初期化も、todo_manager.js でやっていました。それから、todo ビューの index.js に対応するテンプレートとして、「app.js が自動生成された index.js に対応するのか、それなら名前を変えなくては！」と気づいたのも、いったん動作するアプリにしてからでした。ブートストラップファイルの導入とファイル分割によって、各モジュール(コレクションとかモデルとか)間の情報の受け渡しを改良することができた点は、前回から地味に成長したところです。
