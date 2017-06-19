require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders) }
  it { should have_many(:address) }
  it { should have_one(:cart) }
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:username).is_at_least(2).is_at_most(30) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name).is_at_least(2).is_at_most(30) }
  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name).is_at_least(2).is_at_most(30) }
  it { should validate_presence_of(:bithdate) }
end
