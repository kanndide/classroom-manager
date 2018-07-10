class UsersController < ApplicationController

	def new
		@user = User.new
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

	

end
