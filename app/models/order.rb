class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :user_cart_items
  validates :status, presence: true
end
