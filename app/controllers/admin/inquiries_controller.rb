class Admin::InquiriesController < ApplicationController
  
  before_action :authenticate_admin!
  before_action :set_inquiry, only: [:show, :update]
     
  #検索窓の実装
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    inquiries = Inquiry.search(params[:search]).order(id:"DESC")
    @inquiries_unconfirmed = inquiries.unconfirmed
    @inquiries_not_received = inquiries.not_received
    @inquiries_order_received = inquiries.order_received
    @inquiries_done = inquiries.done
    @inquiries = inquiries
    @search_word = params[:search]
    render :"admin/homes/top"
  end
  
  def show
  end
  
  def update
    @inquiry.update(inquiry_params)
    flash.now[:success] = "ステータスを更新しました。"
    render :show
  end
  
  def index
    customer = Customer.find(params[:format])
    @inquiries = customer.inquiries.order(id:"DESC").page(params[:page])
  end
  
  private
  
  def inquiry_params
    params.require(:inquiry).permit(:order_status)
  end
  
  def set_inquiry
    @inquiry = Inquiry.find(params[:id]) 
  end

end
