class SchoolsController < ApplicationController

	before_action :require_admin
	skip_before_action :require_admin, only: [:show]

	def index
		@schools = School.all
	end

	def new
		@school = School.new
	end

	def create
		if School.exists?(:name => params[:school][:name])
			flash[:danger] = "That school already exists in our system."
			redirect_to new_user_school_path(current_user)
		else
			@school = School.new(school_params)
			if @school.save
				flash[:success] = "#{@school.name} has been successfully added."
				redirect_to user_path(current_user)
			else
				flash[:danger] = "Something went wrong. Please try again."
				render :new
			end
		end
	end

	def show
		@school = School.find(params[:id])
	end

	def edit
		@school = School.find_by(params[:id])
	end

	def update
		@school = School.find_by(params[:id])
		@school.update(school_params)

		if @school.save
			flash[:success] = "Changes have been saved."
			redirect_to user_path(current_user)
		else
			flash[:danger] = "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy

	end

	private

	def school_params
		params.require(:school).permit(:name)
	end

	def require_admin
		if !current_user.admin
			flash[:danger] = "You must be Admin in order to access this feature."
			redirect_to user_path(current_user)
		end
	end

end
