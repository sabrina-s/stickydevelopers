class Address < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :line1, presence: true
  validates :zipcode, presence: true
  validates :country, presence: true
  validates :contact_person, presence: true
  validates :contact_no, presence: true
  validates :type, presence: true
end
