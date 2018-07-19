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
		elsif password_confirmation
			@user = User.new(user_params)
			if @user.save
				log_in(@user)
				flash[:success] = "You're account is activated."
				redirect_to user_path(@user)
			else
				flash[:danger] = "Something went wrong. Please try again."
				render :new
			end
		elsif !password_confirmation
			flash[:danger] = "The passwords must match."
			render :new
		end
		
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		set_user
	end

	def update
		set_user
		@user.update(user_params)

		if @user.save
			flash[:success] = "Thank you for updating your profile."
			redirect_to user_path(@user)
		else
			flash[:danger] = "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
		User.find(params[:id]).destroy
		session.delete(:user_id)
		flash[:success] = "You're account has been deleted."
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :bio, :teacher)
	end

	def require_login
		if !logged_in?
			flash[:danger] = "You must be logged in to do that."
			redirect_to signin_path
		end
	end

	def password_confirmation
		params[:password] == params[:password_confirmation]
	end

	def set_user
		if current_user.admin
			@user = User.find(params[:id])
		elsif current_user.id == params[:id].to_i
			@user = current_user
		end
		@user
	end

	

end
