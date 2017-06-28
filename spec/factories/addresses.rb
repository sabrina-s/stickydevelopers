FactoryGirl.define do
  factory :address do
    label "Label"
    line1 "MyString"
    line2 "MyString"
    zipcode "MyString"
    country "MyString"
    contact_person "MyString"
    contact_no "MyString"
    add_type "Shipping"

    trait :invalid do
      label nil
    end
  end
end
