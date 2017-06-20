class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :variation

  validates :order, presence: true
  validates :variation, presence: true
  validates :amount, presence: true, numericality: true
end
