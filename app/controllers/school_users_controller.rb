class SchoolUsersController < ApplicationController

	def new
		@schooluser = SchoolUser.new
		@schools = School.all
	end

	def create
		@school = School.find(params[:school_user][:school_id])
		SchoolUser.create(:school_id => @school.id, :user_id => current_user.id)
		flash[:success] = "You have have been associated with #{@school.name}."
		redirect_to user_path(current_user)
	end

end
