require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:variation) }
  it { should validate_presence_of(:order) }
  it { should validate_presence_of(:variation) }
  it { should validate_presence_of(:amount) }
  it { should validate_numericality_of(:amount) }
end
