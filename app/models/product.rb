class Product < ActiveRecord::Base
	has_many :reviews
	has_many :users, through: :reviews

	validates :name, presence: true
	validates :description, :name, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	def formatted_price
		price_in_dolalrs = price_in_cents.to_f/100
		# sprintf method rounds number to two decimals
		sprintf("%.2f", price_in_dolalrs)
	end 
end
