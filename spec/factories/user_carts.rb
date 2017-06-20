FactoryGirl.define do
  factory :user_cart do
    association :user
    session "MyString"
  end
end
