class School < ApplicationRecord

	has_many :lectures
	has_many :school_users
	has_many :users, through: :school_users

	def self.school_with_most_lectures
		joins(:lectures).group(:name).order('count_id DESC').count('id')
	end

end
