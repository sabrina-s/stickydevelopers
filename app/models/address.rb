class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :line1, presence: true, length: { minimum: 1, maximum: 50 }
  validates :line2, length: { maximum: 50 }
  validates :zipcode, presence: true, length: { maximum: 20 }
  validates :country, presence: true
  validates :contact_person, presence: true, length: { maximum: 50 }
  validates :contact_no, presence: true, length: { maximum: 30 }
  validates :add_type, presence: true
  validates :label, presence: true, length: { minimum: 1, maximum: 30 }

  enum add_type: {
    "Billing": 1,
    "Shipping": 2
  }
end
