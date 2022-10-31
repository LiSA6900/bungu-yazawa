class InquiryMailer < ApplicationMailer
    
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: '',
      to: 'amnos.1999.arasick@gmail.com'
      subject: 'お問合せ通知'
    )
  end
    
end
