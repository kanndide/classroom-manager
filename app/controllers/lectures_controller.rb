class LecturesController < ApplicationController

	before_action :require_teacher

	def index
		@user = current_user
		@lectures = @user.lectures
		binding.pry
	end

	def new
		@lecture = Lecture.new
	end

	def create
		if Lecture.exists?(params[:lecture])
			flash[:danger] = "That lecture already exists in our system."
			redirect_to new_user_lecture_path(current_user)
		else
			@lecture = Lecture.new(lecture_params)
			if @lecture.save
				UserLecture.create(:user_id => current_user.id, :lecture_id => @lecture.id)
				flash[:success] = "#{@lecture.name} has been successfully added."
				redirect_to user_lectures_path(current_user)
			else
				flash[:danger] = "Something went wrong. Please try again."
				render :new
			end
		end
	end

	def show

	end

	def edit
		@lecture = Lecture.find_by(params[:lecture_id])
	end

	def update
		@lecture = Lecture.find_by(params[:lecture_id])
		@lecture.update(lecture_params)

		if @lecture.save
			flash[:success] = "Changes have been saved."
			redirect_to user_lectures_path
		else
			flash[:danger] = "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy

	end

	private

	def lecture_params
		params.require(:lecture).permit(:name, :time, :day, :location, :semester)
	end

	def require_teacher
		if !current_user.admin && !current_user.teacher
			flash[:danger] = "You must be a teacher or admin in order to access this feature."
			redirect_to user_path(current_user)
		end
	end

end
