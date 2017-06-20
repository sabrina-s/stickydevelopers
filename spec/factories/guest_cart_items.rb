FactoryGirl.define do
  factory :guest_cart_item do
    association :guest_cart
    association :variation
  end
end
