class GuestCart < ApplicationRecord
  validates :session, presence: true
end
