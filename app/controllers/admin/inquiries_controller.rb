class Admin::InquiriesController < ApplicationController
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
end
