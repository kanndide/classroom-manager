class UserLecturesController < ApplicationController

	def create
		@lecture = Lecture.find(params[:id])
		UserLecture.create(:user_id => current_user.id, :lecture_id => @lecture.id)
		flash[:success] = "Lecture has been successfully added to your schedule."
		redirect_to user_lectures_path(current_user)
	end

end
