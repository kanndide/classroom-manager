class SchoolsController < ApplicationController

	before_action :require_admin
	skip_before_action :require_admin, only: [:show, :index]

	def index
		@schools = School.all
	end

	def new
		set_school
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
		set_school
	end

	def edit
		set_school
	end

	def update
		set_school
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
		set_school.destroy
		flash[:success] = "School Deleted"
		redirect_to schools_path
	end

	private

	def school_params
		params.require(:school).permit(:name)
	end

	def set_school
		if params[:id]
			@school = School.find(params[:id])
		else
			@school = School.new
		end
		@school
	end

end
