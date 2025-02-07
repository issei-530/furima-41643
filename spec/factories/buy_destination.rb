FactoryBot.define do
  factory :buy_destination do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {'890-0082'}
    region_id {2}
    city {Faker::Address.city}
    street_address {Faker::Address.street_address}
    building_name {"桜七番館"}
    telephone {'09010909021'}
  end
end