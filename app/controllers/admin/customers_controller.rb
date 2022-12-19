class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_customer, only: [:show, :edit, :update]
    
    def index
        @customers = Customer.order(id:"DESC").page(params[:page])
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        @customer.update(customer_params)
        render :show
    end
    
    
    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
    end
    
    def set_customer
        @customer = Customer.find(params[:id]) 
    end
    
end
