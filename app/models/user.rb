class User < ApplicationRecord
	
	has_many :user_lectures
	has_many :lectures, through: :user_lectures
	has_many :school_users
	has_many :schools, through: :school_users
	has_secure_password

	def self.from_omniauth(auth_hash)
	    user = User.find_by(uid: auth_hash['uid'])
	    if user
	    	user
	    else
		    user = User.create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
		    user.username = auth_hash['info']['nickname']
		    user.email = auth_hash['info']['email']
		    user.first_name = auth_hash['info']['name'].split(" ").first
		    user.last_name = auth_hash['info']['name'].split(" ").last
		    user.image_url = auth_hash['info']['image']
		    user.url = auth_hash['info']['urls'][user.provider.capitalize]
		    user.password = SecureRandom.hex
		    user.save!
		    user
		end
  	end

  	def is_profile_complete?
  		!!self.first_name && !!self.last_name && !!self.email
  	end

end
