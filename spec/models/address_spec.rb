require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:order) }

  it { should validate_presence_of(:line1) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:contact_person) }
  it { should validate_presence_of(:contact_no) }
  it { should validate_presence_of(:type) }
end
