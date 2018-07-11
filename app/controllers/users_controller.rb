class UsersController < ApplicationController

	before_action :require_login
	skip_before_action :require_login, only: [:new, :create]

	def new
		if logged_in?
			redirect_to user_path(current_user)
		else
			@user = User.new
		end
	end

	def create
		if User.exists?(:username => params[:user][:username])
			flash[:danger] = "Sorry, that username already exists."
			redirect_to new_user_path
		elsif params[:password] == params[:password_confirmation]
			@user = User.new(user_params)
			if @user.save
				log_in(@user)
				flash[:success] = "You're account is activated."
				redirect_to user_path(@user)
			else
				redirect_to new_user_path
			end
		end
		
	end

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)

		if @user.save
			flash[:success] = "Thank you for updating your profile."
			redirect_to user_path(@user)
		else
			flash[:danger] = "Something went wrong. Please try again."
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :bio)
	end

	def require_login
		if !logged_in?
			flash[:danger] = "You must be logged in to do that."
			redirect_to signin_path
		end
	end

	

end
