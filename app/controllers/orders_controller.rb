class OrdersController < ApplicationController
    def index
        @employee = Employee.find(params[:employee_id])
        @orders = @employee.orders
    end
    
    def new
    end
    
    def show
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
    def delete
    end
end
