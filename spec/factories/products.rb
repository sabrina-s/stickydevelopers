FactoryGirl.define do
  factory :product do
    name "Ruby"
    description "Ruby sticker"
    # association :primary_pic, factory: :photo
  end
end
