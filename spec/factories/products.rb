FactoryGirl.define do
  factory :product do
    name "Sticker"
    description "Dev sticker"
    sequence(:slug) { |n| "slug#{n}" }
    # association :primary_pic, factory: :photo
  end
end
