class Review < ActiveRecord::Base

  has_one :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, numericality: true

end
