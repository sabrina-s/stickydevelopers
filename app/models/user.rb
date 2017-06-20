class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :addresses
  has_many :orders
  has_one :user_cart
  validates :first_name, presence: true, length: { maximum: 30, minimum: 2 }
  validates :last_name, presence: true, length: { maximum: 30, minimum: 2 }
  validates :birthdate, presence: true
  validates :username, presence: true, length: { maximum: 30, minimum: 2 }, uniqueness: { case_sensitive: false }
  #validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.provider = "facebook"
        user.uid = data["id"] if user.uid.blank?
        user.email = data["email"] if user.email.blank?
        user.first_name = data["name"] if user.first_name.blank?
      end
    end
  end
end
