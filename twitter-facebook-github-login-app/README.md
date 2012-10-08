# twitter-facebook-github-login-app

rails での twitter/facebook/github ログイン機能を実装しました。

* rails (3.2.8)
* omniauth (1.1.1)
* omniauth-twitter (0.0.13)
* omniauth-facebook (1.3.0)
* omniauth-github (1.0.1)

## 流れ

[twitter-facebook-github-login-app](https://github.com/mori-dev/my-sample-apps/tree/master/twitter-login-app) と同様です。

## 課題

* プロバイダ認証後のコールバックメソッドでは、コントローラに処理をすべて書いています。これを移動させるのと、twitter(), github(), facebook() 内の重複をなくすとよいです。
* このサンプルでは、手元のデータベースの users テーブルでは、 provider, uid, name しか扱っていません。メールアドレスやパスワードなど、他の情報が必要になる場合は、要件に応じた対応が必要です。

## リンク

* [Twitter アプリの作成](https://dev.twitter.com/apps/new)
* [Facebook アプリの作成](https://developers.facebook.com/apps)
* [github アプリの作成](https://github.com/settings/applications/new)
