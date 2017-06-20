FactoryGirl.define do
  factory :variation do
    association :product
    label "MyString"
    price 1
    stock 1
  end
end
