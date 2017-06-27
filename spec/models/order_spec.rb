require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:address) }
  it { should have_many(:user_cart_items) }

  it { should validate_presence_of(:status) }
end
