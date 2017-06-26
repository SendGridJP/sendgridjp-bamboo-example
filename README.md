# SendgridjpBambooExample

本コードはElixir bambooパッケージの利用サンプルです。

## インストール

```shell
# サンプルコードをcloneします。
$ git clone http://github.com/sendgridjp/sendgridjp-bamboo-example.git
$ cd sendgridjp-bamboo-example

# 環境変数にSendGridのAPIキーを設定します。
$ export SENDGRID_API_KEY=SG.********

# サンプルコードの宛先（to）と送信元（from）を編集します。
$ vi lib/sendgridjp_bamboo_example/email.ex
```

## 実行

iexを起動します。

```shell
$ iex -S mix
```

単一の宛先に1通のメールを送信するサンプルを実行します。

```elixir
iex(1)> SendgridjpBambooExample.Email.single_email_to_a_single_recipient |> SendgridjpBambooExample.Mailer.deliver_now

11:17:05.235 [debug] Sending email with Bamboo.SendgridAdapter:

%Bamboo.Email{assigns: %{}, bcc: [], cc: [], from: {"送信社名", "from@example.com"}, headers: %{}, html_body: "<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。", private: %{"x-smtpapi" => %{"sub" => %{"familyname" => ["田中"], "fullname" => ["田中 太郎"], "place" => ["中野"]}}}, subject: "[sendgridjp-bamboo-example] フクロウのお名前はfullnameさん", text_body: "familyname さんは何をしていますか？\r\n 彼はplaceにいます。", to: [nil: "to@example.com"]}

%Bamboo.Email{assigns: %{}, bcc: [], cc: [],
 from: {"送信社名", "from@example.com"}, headers: %{},
 html_body: "<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。",
 private: %{"x-smtpapi" => %{"sub" => %{"familyname" => ["田中"],
       "fullname" => ["田中 太郎"], "place" => ["中野"]}}},
 subject: "[sendgridjp-bamboo-example] フクロウのお名前はfullnameさん",
 text_body: "familyname さんは何をしていますか？\r\n 彼はplaceにいます。",
 to: [nil: "to@example.com"]}

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sendgridjp_bamboo_example` to your list of dependencies in `mix.exs`:
```

複数の宛先にそれぞれ1通のメールを送信するサンプルを実行します。

```elixir
iex(2)> SendgridjpBambooExample.Email.single_email_to_multiple_recipients |> SendgridjpBambooExample.Mailer.deliver_now

11:18:18.738 [debug] Sending email with Bamboo.SendgridAdapter:

%Bamboo.Email{assigns: %{}, bcc: [], cc: [], from: {"送信社名", "from@example.com"}, headers: %{}, html_body: "<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。", private: %{"x-smtpapi" => %{"section" => %{"home" => "目黒", "office" => "中野"}, "sub" => %{"familyname" => ["田中", "佐藤", "鈴木"], "fullname" => ["田中 太郎", "佐藤 次郎", "鈴木 三郎"], "place" => ["office", "home", "office"]}, "to" => ["to1@example.com", "to2@example.com", "to3@example.com"]}}, subject: "[sendgridjp-bamboo-example] フクロウのお名前はfullnameさん", text_body: "familyname さんは何をしていますか？\r\n 彼はplaceにいます。", to: [nil: "dummy@example.com"]}

%Bamboo.Email{assigns: %{}, bcc: [], cc: [],
 from: {"送信社名", "from@example.com"}, headers: %{},
 html_body: "<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。",
 private: %{"x-smtpapi" => %{"section" => %{"home" => "目黒",
       "office" => "中野"},
     "sub" => %{"familyname" => ["田中", "佐藤", "鈴木"],
       "fullname" => ["田中 太郎", "佐藤 次郎", "鈴木 三郎"],
       "place" => ["office", "home", "office"]},
     "to" => ["to1@example.com", "to2@example.com", "to3@example.com"]}},
 subject: "[sendgridjp-bamboo-example] フクロウのお名前はfullnameさん",
 text_body: "familyname さんは何をしていますか？\r\n 彼はplaceにいます。",
 to: [nil: "dummy@example.com"]}
```
