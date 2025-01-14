FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name {"大塚一生"}
    kana_name {"オオツカイッセイ"}
    birth_id {"1991-05-30"}
  end
end