module CurrentUser
  extend ActiveSupport::Concern
  
  included do
    before_action :require_current_user
    helper_method :logged_in?
    helper_method :current_user
  end

  private
    def require_current_user
      unless current_user
        redirect_to login_url, notice: "Welcome! Please login"
      end
    end

    def logged_in?
      current_user.present?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
