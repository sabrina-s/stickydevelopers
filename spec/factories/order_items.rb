FactoryGirl.define do
  factory :order_item do
    association :order
    association :variation
    amount 1
  end
end
