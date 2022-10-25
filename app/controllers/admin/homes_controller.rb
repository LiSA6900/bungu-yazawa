class Admin::HomesController < ApplicationController
  def top
    #inquiryコントローラーのsearchメソッドの書き方でもOK
    @inquiries = Inquiry.order(id:"DESC").page(params[:page])
    @inquiries_unconfirmed = Inquiry.where(order_status: "unconfirmed").order(id:"DESC").page(params[:page])
    @inquiries_not_received = Inquiry.where(order_status: "not_received").order(id:"DESC").page(params[:page])
    @inquiries_order_received = Inquiry.where(order_status: "order_received").order(id:"DESC").page(params[:page])
    @inquiries_done = Inquiry.where(order_status: "done").order(id:"DESC").page(params[:page])
  end
end
