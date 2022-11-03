class InquiryMailer < ApplicationMailer
  
  # メール送信元アドレスを設定する
  default from: "inquiry@example.com"

  def sendmail_inquiry(inquiry)
    @inquiry = inquiry
    if Rails.env.production?
      @log_in_url = "http://本番url"
    else
      @log_in_url = "https://66427f89fd0549c6baf4beba59e779c8.vfs.cloud9.ap-northeast-1.amazonaws.com/admin/sign_in"
    end
    # メール送信先アドレスを設定する
    mail to: "amnos.1999.arasick@gmail.com",
         subject: "お問い合わせが届きました。"  # メール件名
  end
    
end
