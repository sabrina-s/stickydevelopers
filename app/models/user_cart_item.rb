class UserCartItem < ApplicationRecord
  belongs_to :user_cart, optional: true
  belongs_to :variation
  belongs_to :order, optional: true
  validates :amount, presence: true, numericality: true
  validates :user_cart, presence: true
  validates :variation, presence: true
end
