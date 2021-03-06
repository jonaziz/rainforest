class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :comment, :product_id, :user_id

  validates :comment, :product, :user, :presence => true
end
