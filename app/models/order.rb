class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :user_cart_items
  validates :status, presence: true

  enum status: {
    "Payment Pending": 1,
    "Paid": 2,
    "Packed": 3,
    "Shipped": 4
  }

  def get_total
    sum = 0
    self.user_cart_items.each do |item|
      sum += item.amount * item.variation.price
    end
    return sum
  end

  def minus_stock
    self.user_cart_items.each do |item|
      remaining_stock = item.variation.stock - item.amount
      item.variation.update(stock: remaining_stock)
    end
  end
end
