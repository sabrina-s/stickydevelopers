class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :variations, dependent: :destroy
  has_many :orders, through: :variations

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
