FactoryGirl.define do
  factory :user_cart_item do
    association :user_cart
    association :variation
    amount 1
  end
end
