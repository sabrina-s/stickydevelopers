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

  def get_total
    sum = 0
    self.user_cart_items.each do |item|
      sum += item.amount * item.variation.price
    end
    return sum
  end
end
