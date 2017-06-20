FactoryGirl.define do
  factory :admin do
    # sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    password "123123"
  end
end
