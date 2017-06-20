class GuestCartItem < ApplicationRecord
  belongs_to :guest_cart
  belongs_to :variation

  validates :guest_cart, presence: true
  validates :variation, presence: true
  validates :amount, presence: true, numericality: true
end
