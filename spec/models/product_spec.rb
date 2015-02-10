require 'rails_helper'
require 'spec_helper'

describe Product do 
	let!(:product) { create(:product) }

	# Example spec
  	it "must have a name" do
    	product.name = ""
    	expect(product).to_not be_valid
  	end

	it "must have a name" do 
		product = Product.new
		expect(product.name).to be_nil
		expect(product).to_not be_valid
	end 
	it "must have a description" do 
		product = Product.new
		expect(product.description).to be_nil
		expect(product).to_not be_valid
	end 
	it "must have a price" do 
		product = Product.new
		expect(product.price_in_cents).to be_nil
		expect(product).to_not be_valid
	end 
	# it "must have a price that is an integer" do 
		# product = Product.new
		# expect(product.price_in_cents).to be_an(Integer)
		# expect(product).to_not be_valid

		# @product.price_in_cents.class.should eq Integer
		
		# its("price_in_cents") { should eq Integer}
		
		# expect(price_in_cents).to be > 0
	# end 

	# it "must have a formatted price" do
	# end  

	it "can have many reviews" do 
    	Product.reflect_on_association(:reviews).macro == :has_many
	end 

	# it "can list users that have reviewed it without duplicates" do
	# end 
end 
