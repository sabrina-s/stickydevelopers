FactoryGirl.define do
  factory :product do
    name "Sticker"
    description "Dev sticker"
    sequence(:slug) { |n| "slug#{n}" }
    # association :primary_pic, factory: :photo

    trait :invalid do
      name ""
      description nil
      slug nil
    end
  end
end
