class Review < ActiveRecord::Base

  belongs_to :user

  validates :product_id, presence: true,
  validates :user_id, presence: true,
  validates :description, length: { 2..140 },
  validates :rating, numericality: true

end
