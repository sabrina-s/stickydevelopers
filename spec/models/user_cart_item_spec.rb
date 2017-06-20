require 'rails_helper'

RSpec.describe UserCartItem, type: :model do
  it { should belong_to(:user_cart) }
  it { should belong_to(:variation) }
  it { should validate_presence_of(:user_cart) }
  it { should validate_presence_of(:variation) }
  it { should validate_presence_of(:amount) }
  it { should validate_numericality_of(:amount) }
end
