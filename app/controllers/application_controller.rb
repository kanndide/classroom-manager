class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	  def log_in(user)
	  	session[:user_id] = user.id
	  end

	  def current_user
	  	@current_user ||= User.find_by(id: session[:user_id])
	  end

	  def logged_in?
	  	!!current_user
	  end

	  def require_admin
		if !current_user.admin
			flash[:danger] = "You must be Admin in order to access this feature."
			redirect_to user_path(current_user)
		end
	end
	
	  helper_method :current_user
end
