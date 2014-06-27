class UserSessionsController < ApplicationController
  skip_before_action :require_current_user

	def new
	end
	
	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url
		else
			flash[:error] = "Unable to log in. Please check your email and password."
			redirect_to login_url
		end
	end
	
	def destroy
		session[:user_id] = nil
		reset_session
		redirect_to root_url, notice: "Logged out"
	end
end
