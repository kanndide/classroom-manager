class User < ApplicationRecord
	
	has_many :user_lectures
	has_many :lectures, through: :user_lectures
	has_many :school_users
	has_many :schools, through: :school_users
	has_secure_password

end
