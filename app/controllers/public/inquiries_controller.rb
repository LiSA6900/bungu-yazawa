class Public::InquiriesController < ApplicationController
  
  before_action :authenticate_customer!
  
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.customer_id = current_customer.id
    if @inquiry.save
      InquiryMailer.sendmail_inquiry(@inquiry).deliver # ここで呼び出している
      redirect_to inquiries_path
    else
      flash.now[:alart] = "必須項目を入力してください。"
      render :new
    end
  end

  def index
    @inquiries = current_customer.inquiries.order(id:"DESC").page(params[:page]).per(10)
  end
  
  def show
    @inquiry = Inquiry.find(params[:id])
  end
  
  
  private
  def inquiry_params
    params.require(:inquiry).permit(:title, :body, :order_status, images: [])
  end
  
end

