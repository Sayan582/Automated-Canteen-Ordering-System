class EmployeeMailer < ApplicationMailer

    default :from => "cos@gmail.com"
  
    def welcome_email(employee)
      @employee = employee
      attachments.inline['logo3.png'] = File.read("app/assets/images/logo3.png")
      mail(:to => @employee.email, :subject => "Welcome to Dinner Dash Cafe")
    end
  
    def order_email(employee, items)
      @current_order = JSON.parse(items)
      @employee = employee
      @order = @employee.orders.last.id
      attachments.inline['logo3.png'] = File.read("app/assets/images/logo3.png")
      mail(:to => @employee.email, :subject => "Your order:#{@order} is being processed")
    end
  
    def status_email(order)
      @order = order
      @status = @order.Status
      @employee = employee.find(@order.employee_id)
      attachments.inline['logo3.png'] = File.read("app/assets/images/logo3.png")
      mail(:to => @employee.email, :subject => "Your order:#{@order.id} is now #{@status}")
    end
  
  end
  