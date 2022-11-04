class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!
  
    def show
        @customer = current_customer
    end
    
    def edit
       @customer = current_customer
    end
    
    def update
      @customer = current_customer
      if @customer.update(customer_params)
        redirect_to customers_my_page_path
      else
        flash.now[:alart] = "入力内容に不備がございます。全ての項目へ入力をお願いします。"
        render :edit
      end
    end
    
    def unsubscribe
    end
    
    def withdraw
      @customer = current_customer
       # is_deletedカラムをtrueに変更することにより削除フラグを立てる
      @customer.update(is_deleted: true)
      reset_session
      flash[:success] = "退会処理が完了いたしました。ご利用ありがとうございました。"
      redirect_to root_path
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_numbe, :email, :is_deleted)
    end
    
end
