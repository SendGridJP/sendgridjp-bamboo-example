defmodule SendgridjpBambooExample.Email do
  @moduledoc """
  Documentation for SendgridjpBambooExample.Email
  """
  import Bamboo.Email
  import Bamboo.SendgridHelper

  @doc """
  単一の宛先に1通のメールを生成
  """
  def single_email_to_a_single_recipient do
    from = %SendgridjpBambooExample.User{name: "送信社名", email: "from@example.com"}
    new_email()
    |> to("to@example.com")
    |> from(from)
    |> subject("[sendgridjp-bamboo-example] フクロウのお名前はfullnameさん")
    |> text_body("familyname さんは何をしていますか？\r\n 彼はplaceにいます。")
    |> html_body("<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。")
    |> substitute("fullname", "田中 太郎")
    |> substitute("familyname", "田中")
    |> substitute("place", "中野")
  end

  @doc """
  複数の宛先にそれぞれ1通のメールを生成
  """
  def single_email_to_multiple_recipients do
    from = %SendgridjpBambooExample.User{name: "送信社名", email: "from@example.com"}
    smtpapi = %{
      "to" => ["to1@example.com", "to2@example.com", "to3@example.com"],
      "sub" => %{
        "fullname" => ["田中 太郎", "佐藤 次郎", "鈴木 三郎"],
        "familyname" => ["田中", "佐藤", "鈴木"],
        "place" => ["office", "home", "office"]
      },
      "section" => %{
        "office" => "中野",
        "home" => "目黒"
      }
    }
    new_email()
    |> to("dummy@example.com")  # 実際の宛先はx-smtpapiで指定。これはダミー
    |> from(from)
    |> subject("[sendgridjp-bamboo-example] フクロウのお名前はfullnameさん")
    |> text_body("familyname さんは何をしていますか？\r\n 彼はplaceにいます。")
    |> html_body("<strong> familyname さんは何をしていますか？</strong><br />彼はplaceにいます。")
    |> put_private("x-smtpapi", smtpapi)
  end
end
