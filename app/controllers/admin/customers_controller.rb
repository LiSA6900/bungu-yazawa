class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.order(id:"DESC").page(params[:page])
    end
end
