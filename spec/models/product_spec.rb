require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:variations).dependent(:destroy) }
  it { should have_many(:orders).through(:variations) }
end
