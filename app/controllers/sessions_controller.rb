class SessionsController < ApplicationController
  def new
  	# Dont have to instatiate a user object 
  	# because we are only logging in, 
  	# not creating a new user
  end

  def create
  	# Find user by email typed in the email field
  	# assign it to the variable user
  	user = User.find_by(email: params[:email])
  	# Check if that user exists and that it can
  	# be authenticated with the password from 
  	# the password field
  	if user && user.authenticate(params[:password])
  		# If both true, create a key-value pair in 
  		# the session hash :user_id (key) user's id (value)
  		session[:user_id] = user.id
  		redirect_to products_url, notice: "Logged in!"
  	else
  		render "new"
  	end 
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, notice: "Logged out!"
  end
end

# This gist of logging in is that we are setting 
# a hash in our users' browser to let our server 
# (application) reference as they navigate through 
# the application
