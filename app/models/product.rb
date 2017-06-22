class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :variations, dependent: :destroy
end
