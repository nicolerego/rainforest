require 'rails_helper'
require 'spec_helper'

describe Review do 
	it "must have a user" do 
		review = Review.new
		expect(review.user).to be_nil
		expect(review).to_not be_valid
	end 

	it "must have a comment" do 
		review = Review.new
		expect(review.comment).to be_nil
		expect(review).to_not be_valid
	end 
end 
