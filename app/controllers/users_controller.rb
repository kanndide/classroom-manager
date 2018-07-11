class UsersController < ApplicationController

	def new
		if logged_in?
			redirect_to user_path(current_user)
		else
			@user = User.new
		end
	end

	def create
		if User.exists?(:username => params[:username])
			flash[:danger] = "Sorry, that username already exists."
			redirect_to new_user_path
		elsif params[:password] == params[:password_confirmation]
			@user = User.new(user_params)
		end
		
		if @user.save
			log_in(@user)
			redirect_to user_path(@user)
		else
			redirect_to new_user_path
		end
	end

	def show
		if logged_in?
			@user = current_user
		else
			redirect_to signin_path
		end
	end

	def update

	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :bio)
	end

	

end
