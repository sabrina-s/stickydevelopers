class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  validates :status, presence: true
end
