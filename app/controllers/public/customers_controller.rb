class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!, except: [:index]
  before_action :set_customer, only: [:show, :edit, :update, :withdraw]
  
    def index
      redirect_to new_customer_registration_path
    end
  
    def show
    end
    
    def edit
    end
    
    def update
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
      # ゲストユーザーが退会処理をしようとしたらログアウトさせトップページにレダイレクトさせる
      if @customer.email == 'guest@test.com'
        reset_session
        flash[:success] = "ゲストユーザーは削除できません。"
        redirect_to root_path
      else
        # is_deletedカラムをtrueに変更することにより削除フラグを立てる
        @customer.update(is_deleted: true)
        reset_session
        flash[:success] = "退会処理が完了いたしました。ご利用ありがとうございました。"
        redirect_to root_path
      end
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
    end
    
    def set_customer
      @customer = current_customer
    end
    
end
