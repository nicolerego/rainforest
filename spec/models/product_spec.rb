require 'rails_helper'

describe Product do 
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
	it "must have a price that is an integer" do 
		product = Product.new
		expect(product.price_in_cents).to be_an(Integer)
		expect(product).to_not be_valid
	end 
end 

require 'spec_helper'

describe Product do
  #Arrange necessary preconditions and inputs
  let!(:product) { create(:product) }

  # Example spec
  it "must have a name" do
    #Act on the object of the method under spec
    product.name = ""

    #Assert that the expected results have occurred
    expect(product).to_not be_valid
  end

end


# A product's price must be an integer
# A product has a formatted price
# A product can have many reviews
# A product can list users that have reviewed it without duplicates
