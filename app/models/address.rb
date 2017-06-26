class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :line1, presence: true
  validates :zipcode, presence: true
  validates :country, presence: true
  validates :contact_person, presence: true
  validates :contact_no, presence: true
  validates :add_type, presence: true
end
