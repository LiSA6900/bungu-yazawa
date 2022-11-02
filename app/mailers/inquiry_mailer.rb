class InquiryMailer < ApplicationMailer
  
  # メール送信元アドレスを設定する
  default from: "inquiry@example.com"

  def sendmail_inquiry(inquiry)
    @inquiry = inquiry
    # メール送信先アドレスを設定する
    mail to: "amnos.1999.arasick@gmail.com",
         subject: "お問い合わせが届きました。"  # メール件名
  end
    
end
