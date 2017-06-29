class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :variations, dependent: :destroy
  has_many :orders, through: :variations

  validates :name, presence: true
  validates :slug, presence: true

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
