class UserCartItem < ApplicationRecord
  belongs_to :user_cart
  belongs_to :variation
end
