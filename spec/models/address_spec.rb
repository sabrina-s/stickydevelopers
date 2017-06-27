require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:orders) }

  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:line1) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:contact_person) }
  it { should validate_presence_of(:contact_no) }
  it { should validate_presence_of(:add_type) }
end
