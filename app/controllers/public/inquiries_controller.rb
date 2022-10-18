class Public::InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.customer_id = current_customer.id
    if @inquiry.save
      redirect_to inquiries_path
    else
      flash[:alart] = "※必須項目を入力してください。"
      render :new
    end
  end

  def index
    @inquiries = current_customer.inquiries.all
  end

  def show
  end
  
  private
  def inquiry_params
    params.require(:inquiry).permit(:title, :body, :image, :order_status)
  end
  
end

