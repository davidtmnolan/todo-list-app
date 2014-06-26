class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	private
	def logged_in?
		current_user
	end
	helper_method :logged_in?
	
	def current_user
		@current_user ||= User.find_by(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
	
	def require_user
		if current_user
			true
		else
			redirect_to login_path, notice: "Welcome!  Please login"
		end
	end
end
