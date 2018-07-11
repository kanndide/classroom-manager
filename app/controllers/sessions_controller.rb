class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to user_path(current_user)
		end
	end

	def create
		if !!auth
			@user = User.from_omniauth(auth)
			log_in(@user)
			flash[:success] = "Welcome, #{@user.username}!"
			redirect_to user_path(@user)
		else
			@user = User.find_by(username: params[:username])
			if @user && @user.authenticate(params[:password]) && params[:username] != ""
	    		log_in(@user)
	    		flash[:success] = "Welcome, #{@user.username}!"
	    		redirect_to user_path(@user)
	    	else 
	    		flash[:danger] = "Wrong Username or Password. Please try again."
	    		redirect_to signin_path
	    	end
	    end
	end

	def destroy
		if current_user
		    session.delete(:user_id)
		    flash[:success] = 'Successfully logged out.'
  		end
  		redirect_to root_path
	end

	private
 
	  def auth
	    request.env['omniauth.auth']
	  end

	  def auth_failure
	  	flash[:danger] = "Something went wrong while trying to Authenticate you. Please make sure you have cookies enabled."
  		redirect_to signin_path
	  end

end