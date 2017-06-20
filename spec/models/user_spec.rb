require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'should validate uniqueness for' do
    subject { User.new(first_name: "Dsa", last_name: "dsad", birthdate: "03-02-1991", username: "dsa") }
    it { should validate_uniqueness_of(:username).case_insensitive }
  end
  it { should have_many(:orders) }
  it { should have_many(:addresses) }
  it { should have_one(:user_cart) }
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:username).is_at_least(2).is_at_most(30) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name).is_at_least(2).is_at_most(30) }
  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name).is_at_least(2).is_at_most(30) }
  it { should validate_presence_of(:birthdate) }
end
