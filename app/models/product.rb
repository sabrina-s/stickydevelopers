class Product < ApplicationRecord
  has_many :variations, dependent: :destroy

end
