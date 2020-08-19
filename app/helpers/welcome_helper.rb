module WelcomeHelper
    def log_in(user)
        session[:employee_id] = employee.id
        current_employee
      end
    
      def admin?
        if logged_in?
         current_employee.role == "admin"
        end
      end
    
      def current_employee
        @current_employee ||= Employee.find_by(id: session[:employee_id])
      end
    
      def logged_in?
        !current_employee.nil?
      end
    
      def log_out
        session.delete(:employee_id)
        @current_employee = nil
      end
    
      def check_if_admin
        if admin?
          true
        else 
          redirect_to root_path
          flash[:danger] = "You do not have access to the Admin page"
        end
      end
end
