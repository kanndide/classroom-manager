class Lecture < ApplicationRecord

	has_many :user_lectures
	has_many :users, through: :user_lectures

end
