require 'rails_helper'

RSpec.describe Variation, type: :model do
  it { should have_many(:orders) }
  it { should have_many(:user_cart_items) }
  it { should belong_to(:product) }

  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:stock) }
  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:stock) }
end
