class WelcomeController < ApplicationController
  def new
    session[:referrer] = request.referer
  end

  def create
      employee = Employee.find_by(email: params[:welcome][:email].downcase)
      if employee && employee.authenticate(params[:welcome])
        log_in employee
        if admin?
          redirect_to dashboard_path
        else
          redirect_to session[:referrer]
        end
      else
        flash.now[:danger] = "Invalid email/password confirmation"
        render "new"
      end
  end

  def destroy
      log_out
      redirect_to foods_path
  end
end
