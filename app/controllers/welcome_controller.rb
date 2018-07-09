class WelcomeController < ApplicationController
 
  	def home
  		@user = current_user if logged_in?
 	end
 	
end
