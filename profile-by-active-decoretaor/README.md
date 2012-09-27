# profile-by-active-decorator

[RailsCasts #286 Draper](http://railscasts.com/episodes/286-draper) を [active_decorator gem](https://github.com/amatsuda/active_decorator) で書き換えて、両者の共通点/相違点を調査しました。

## わかったこと

* RailsCast に載っている程度の例であれば、Draper も active_decorator もほとんど違いはない。Draper では作成したデコレータの公開範囲を指定できるとわかるが、たいして重要な機能ではないと思う
* デコレータを導入することで、モデルにビューのためのヘルパーメソッドを書かずにすみ、うまく分業できる
* デコレータを導入することで、ビューでの条件分岐をいくつかうまく隠蔽できる。もっともそれはヘルパー(app/helpers)でも実現できていた
* デコレータを導入し、ヘルパーからモデルに由来するメソッドをデコレータに移動させることで、ヘルパーにあったメソッドを、よりオブジェクト指向的に捉え直すことができる

## 補足

関連先を decorate したいときにはパーシャルを使うとのの資料をこれとは別にみつけました。

* http://speakerdeck.com/embed/5055be2ab4dbee0002047985?slide=97

## 関連リンク

個人ブログでは上記のほかに、Draper 版と ActiveDecoraotr 版のコードを並べてあります。

* [RailsCast #286 Draper を active_decorator で書き直してみて得たこと - わからん](http://d.hatena.ne.jp/kitokitoki/20120904/p1)
