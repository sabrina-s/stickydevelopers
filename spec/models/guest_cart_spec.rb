require 'rails_helper'

RSpec.describe GuestCart, type: :model do
  it { should validate_presence_of(:session) }
end
