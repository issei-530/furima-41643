FactoryBot.define do
  factory :item do
    product_name {Faker::Lorem.sentence}
    product_description {Faker::Lorem.sentence}
    category_id {2}
    product_condition_id {2}
    shipping_fee_id {2}
    region_id {2}
    shipping_day_id {2}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
