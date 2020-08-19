class EmployeeController < ApplicationController
  before_action :check_if_admin, only: [:destroy]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      log_in @employee
      flash[:success] = "Welcome #{employee_params[:ename]} to COS"
      MailerWorker.perform_async(@employee.id)
      redirect_to root_path
    else
      flash[:error] = "One or more required fields are missing"
      render "new"
    end
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    args = args_params || {}
    if @employee
      if !args.nil?
        @orders = @employee.orders
        @title = args[:title] || "Profile"
      else
        @orders = @employee.orders.order(created_at: :desc).limit(3)
        @title = "Recent Orders"
      end
    else
      flash[:message] = "We're sorry we couldn't find any information for this employee."
      redirect_to root_path
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      flash[:success] = "Profile Successfully Updated"
      redirect_to @employee
    else
      render "edit"
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    if employee
      employee.destroy
      flash[:success] = "#{employee.ename} has been deleted."
      redirect_to dashboard_path
    else
      flash[:error] = "An error occured. Try deleting #{@employee.ename} again."
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:ename, :ephone)
  end

  def args_params
    args = params.require(:args).permit(:show_all, :title) if params.has_key? "args"
  end

end
