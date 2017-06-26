class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :variations, dependent: :destroy

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
