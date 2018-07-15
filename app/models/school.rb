class School < ApplicationRecord

	has_many :lectures
	has_many :school_users
	has_many :users, through: :school_users

end
