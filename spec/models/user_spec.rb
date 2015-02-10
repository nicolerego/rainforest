require 'rails_helper'
require 'spec_helper'

describe User do 
	it "must have a name" do 
		user = User.new
		expect(user.name).to be_nil
		expect(user).to_not be_valid
	end 

	# it "can be created with a password and confirmation" do 
	# end
	
	# it "must have a password and confirmation on create" do 
	# end

	# it "must have a confirmation that matches a password" do 
	# end 

	# it "must have a unique email" do 
	# end 

	it "can have many reviews" do 
	User.reflect_on_association(:reviews).macro == :has_many
	end 

	# it "can list products it has reviewed without duplicates" do 
	# end
end 