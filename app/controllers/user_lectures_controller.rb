class UserLecturesController < ApplicationController

	def create
		@lecture = Lecture.find(params[:id])
		UserLecture.create(:user_id => current_user.id, :lecture_id => @lecture.id)
		flash[:success] = "Lecture has been successfully added to your schedule."
		redirect_to user_lectures_path(current_user)
	end

	def destroy
		@userlecture = UserLecture.where(:user_id => 1, :lecture_id => 10)
		@userlecture.each {|x| x.destroy}
		flash[:success] = "Lecture has been removed from your scheudle"
		redirect_to user_lectures_path(current_user)
	end

end
