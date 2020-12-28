# ながのCAKE

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイトです。

## 案件の背景

元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになりました。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至りました。

## 通販について

* 通販では注文に応じて製作する受注生産型としています。
* 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けません。
* 送料は1配送につき全国一律800円。
* 支払方法はクレジットカード、銀行振込から選択できます。

## 用語の定義

### 顧客
 * ながのCAKEの商品を購入する人（客）
### 会員
 * ECサイトにユーザー登録している顧客
### ECサイト
 * 顧客が利用するサイト
### 管理サイト
 * 店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）
### 会員ステータス
 * 現状、有効・退会の2パターンがある。

## 実装機能
### customer（顧客/会員）
* 顧客は会員登録、ログイン・ログアウト、退会ができます。
* 会員のログインはメールアドレスとパスワードで行えます。
* サイトの閲覧はログインなしで行えます。
* 商品をカートに入れ、1度に複数種類、複数商品の購入ができます。また、カート内の商品は個数変更・削除ができます。
* カートへの商品追加はログインなしでは行えません。
* 会員はマイページから、ユーザ情報の閲覧・編集、注文履歴の閲覧ができます。
* 注文履歴一覧には下記の情報が表示されます。
  * 注文日
  * 配送先
  * 注文商品
  * 支払金額（商品合計＋送料）が表示されます。
* 注文履歴詳細には下記の情報が表示されます。
  * 注文日
  * 配送先
  * 支払方法
  * 商品の注文内容詳細（商品名、単価、個数、小計）
  * 請求情報（商品合計、送料、支払金額）
* 会員登録時、下記の情報をユーザ情報として入力できます。
  * 名前（姓・名）
  * 名前（カナ姓・カナ名）
  * 郵便番号
  * 住所
  * 電話番号
  * メールアドレス
  * パスワード

### admin（店側）
* 管理者用メールアドレスとパスワードでログインできます。
* 商品について、新規追加、編集が行えます。
* 商品情報は下記のものを持っています。
  * 商品名
  * 商品説明文
  * 税抜価格
  * 商品画像
* 会員登録されているユーザ情報の閲覧、編集、退会処理が行えます。
* ユーザの注文履歴が一覧・詳細表示できます。
* 注文履歴一覧には注文ごとに下記の情報が表示されます
  * 購入日
  * 購入者
  * 注文個数
* 注文履歴詳細には下記の情報が表示されます。
  * 購入者
  * 配送先
  * 支払方法
  * 商品の注文内容詳細（商品名、単価、個数、小計）
  * 請求情報（商品合計、送料、支払金額）

## 開発環境
### 使用言語
* OS：Linux(CentOS)
* 言語：HTML,CSS,Ruby
* フレームワーク：Ruby on Rails
* 仮想環境：Vagrant

### Gem
* device
* refile
* refile-mini-magick
* bootstrap
* pry-byebug
