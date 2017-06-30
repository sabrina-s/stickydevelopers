FactoryGirl.define do
  factory :order do
    association :user
    association :address
    status "Payment Pending"
  end
end
