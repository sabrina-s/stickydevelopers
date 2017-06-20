FactoryGirl.define do
  factory :user do
    # sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    password "123123"
    first_name "John"
    last_name "Doe"
    username "Sabrina"
    birthdate "01-01-1990"
    # default_shipping ""
  end
end
