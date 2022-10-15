class Public::InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.customer_id = current_customer.id
    @inquiry.save
    redirect_to root_path
  end

  def index
    @inquiries = Inquiry.all
  end

  def show
  end
  
  private
  def inquiry_params
    params.require(:inquiry).permit(:title, :body, :image, :order_status)
  end
  
end

