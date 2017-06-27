class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :user_cart_items
  validates :status, presence: true

  enum status: {
    "New": 1,
    "Payment Pending": 2,
    "Packing": 3,
    "Shipped": 4
  }
end
