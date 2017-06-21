class Variation < ApplicationRecord
  belongs_to :product
  has_many :user_cart_items, dependent: :destroy
  validates :label, presence: true
  validates :price, presence: true, numericality: true
  validates :product, presence: true
  validates :stock, presence: true, numericality: true
end
