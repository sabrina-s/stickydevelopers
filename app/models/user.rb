class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses
  has_many :orders
  has_one :cart
  validates :first_name, presence: true, length: { maximum: 30, minimum: 2 }
  validates :last_name, presence: true, length: { maximum: 30, minimum: 2 }
  validates :birthdate, presence: true
  validates :username, presence: true, length: { maximum: 30, minimum: 2 }, uniqueness: { case_sensitive: false }
  #validates :email, presence: true, uniqueness: { case_sensitive: false }

end
