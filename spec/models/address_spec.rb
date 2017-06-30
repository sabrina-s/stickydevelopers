require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:orders).dependent(:destroy) }

  it { should validate_presence_of(:label) }
  it { should validate_length_of(:label).is_at_most(30).is_at_least(1) }
  it { should validate_presence_of(:line1) }
  it { should validate_length_of(:line1).is_at_most(50).is_at_least(1) }
  it { should validate_length_of(:line2).is_at_most(50) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_length_of(:zipcode).is_at_most(20) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:contact_person) }
  it { should validate_presence_of(:contact_no) }
  it { should validate_length_of(:contact_no).is_at_most(30) }
  it { should validate_presence_of(:add_type) }

  describe '.country_name' do
    let(:user) { create(:user) }
    let(:address) { create(:address, country: "SG", user: user) }
    it 'should get back full name of Singapore' do
      expect(address.country_name).to eq("Singapore")
    end
  end
end
