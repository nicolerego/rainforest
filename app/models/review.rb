class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	validates :comment, :presence => true

	scope :newest_first, -> { order(created_at: :DESC) }
end
