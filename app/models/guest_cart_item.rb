class GuestCartItem < ApplicationRecord
  belongs_to :guest_cart
  belongs_to :variation
end
