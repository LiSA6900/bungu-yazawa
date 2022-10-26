class Admin::InquiriesController < ApplicationController
  #検索窓の実装
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    # @inquiries = Inquiry.all
    # @inquiries = @inquiries.where('title like ?', "#{params[:search]}").or(@inquiries.where('body like ?', "#{params[:search]}")) if params[:search].present?
    # @inquiries = @inquiries.order(id:"DESC").page(params[:page])
    inquiries = Inquiry.search(params[:search]).order(id:"DESC")
    @inquiries_unconfirmed = inquiries.unconfirmed.page(params[:page])
    @inquiries_not_received = inquiries.not_received.page(params[:page])
    @inquiries_order_received = inquiries.order_received.page(params[:page])
    @inquiries_done = inquiries.done.page(params[:page])
    @inquiries = inquiries.page(params[:page])
    render :"admin/homes/top"
  end
  
  def show
    @inquiry = Inquiry.find(params[:id]) 
  end
  
  def update
    @inquiry = Inquiry.find(params[:id]) 
    @inquiry.update(inquiry_params)
    flash[:success] = "ステータスを更新しました。"
    render :show
  end
  
  def index
    customer = Customer.find(params[:format])
    @inquiries = customer.inquiries.order(id:"DESC").page(params[:page])
    # binding.pry
    # @inquiries = Customer.inquiry.page(params[:page])
  end
  
  private
  
  def inquiry_params
    params.require(:inquiry).permit(:order_status)
  end

end
