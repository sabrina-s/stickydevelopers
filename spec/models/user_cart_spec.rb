require 'rails_helper'

RSpec.describe UserCart, type: :model do
  it { should belong_to(:user) }
end
