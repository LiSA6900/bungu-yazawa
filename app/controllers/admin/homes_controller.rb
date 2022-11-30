class Admin::HomesController < ApplicationController
    before_action :authenticate_admin! 
  
  def top
    #inquiryコントローラーのsearchメソッドの書き方でもOK
    @inquiries = Inquiry.order(id:"DESC")
    @inquiries_unconfirmed = Inquiry.where(order_status: "unconfirmed").order(id:"DESC")
    @inquiries_not_received = Inquiry.where(order_status: "not_received").order(id:"DESC")
    @inquiries_order_received = Inquiry.where(order_status: "order_received").order(id:"DESC")
    @inquiries_done = Inquiry.where(order_status: "done").order(id:"DESC")
  end
end
