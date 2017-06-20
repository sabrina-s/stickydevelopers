FactoryGirl.define do
  factory :order do
    association :user
    association :address
    status 1
  end
end
