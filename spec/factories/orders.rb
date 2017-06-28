FactoryGirl.define do
  factory :order do
    association :user
    association :address
    status "New"
  end
end
