class ApplicationController < ActionController::Base
    before_action :set_current_user
    add_flash_types :info, :error, :warning, :danger

    def set_current_user
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def require_user_logged_in!
      if Current.user.nil?
        redirect_to sign_in_path, danger: 'You must be logged in to do this'
      end
    end

    private
      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
        helper_method :current_user #make the private method to be accessible for the view
      
end
