class User < ApplicationRecord
	
	has_many :user_lectures
	has_many :lectures, through: :user_lectures
	has_secure_password

end
