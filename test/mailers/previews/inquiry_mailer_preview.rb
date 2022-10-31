# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
  def inquiry
    inquiry = Inquiry.new(last_name: "山田", first_name: "太郎", title: "コピー用紙の発注", body: "A3のコピー用紙を2箱注文したい。")

    InquiryMailer.send_mail(inquiry)
  end
end
