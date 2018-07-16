class Lecture < ApplicationRecord

	belongs_to :school
	has_many :user_lectures
	has_many :users, through: :user_lectures

	def teacher
		self.users.where(teacher: true)
	end

	def teacher_names
		self.teacher.pluck(:last_name).flatten[0]
	end

	def students
		self.user.where(teacher: false)
	end	

end
