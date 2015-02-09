class User < ActiveRecord::Base
	has_secure_password

	validates :name, presence: true

	has_many :reviews
	has_many :products, through: :reviews

	has_many :owned_products, class_name: "Product", foreign_key: :owner_id
end
