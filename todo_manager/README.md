# todo_manager

[backbone.js の example](https://github.com/documentcloud/backbone/tree/master/examples) にある TODO アプリ todos のバックエンドに Rails を使用し、ストレージを MySQL にしました。

## テンプレートを識別する文字列の変更

* underscore.js のテンプレートの "<%" が ERB と競合するので "{{" へ変更しました。

```ruby:todos.js
  _.templateSettings = {
      interpolate: /\{\{\=(.+?)\}\}/g,
      evaluate: /\{\{(.+?)\}\}/g
  };
```

## 送信先 URL の指定

* コレクションに url: "/todos", と追記しました。

## Rails のコントローラ/アクション

* respond_to / respond_with を活用しました。index では通常の描画のあと、コレクションの fetch により、json を返しています。

```ruby:todos_controller.rb
class TodosController < ApplicationController

  respond_to :json, :html

  def index
    @todos = Todo.all
    respond_with @todos
  end
  ...
```

## その他

* 元の JS にあったローカルストレージの指定を削除しました。
* applicaiton.css.scss, application.js.coffee への設定、app/views/layouts/application.html.erb の利用など。

## 所感

作業中、同様の試みを Qiita で見かけました( [RailsアプリでBackbone.jsを使う](http://qiita.com/items/c14d4554f6af8b4e6159) )。気にせず自分でもためしていると、scaffold していなかったせいか、タスク一覧の取得でうまくゆきませんでした。respond_to / respond_with で HTML と JSON の両方に対応させることで対処できました。初回の index アクセスでは @todos = Todo.all する必要がないはずですので、そこは改良すべき点だと思います。
