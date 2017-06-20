class UserCartItem < ApplicationRecord
  belongs_to :user_cart
  belongs_to :variation

  validates :amount, presence: true, numericality: true
  validates :user_cart, presence: true
  validates :variation, presence: true
end
