FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)+'1a'}
    password_confirmation {password}
    first_name {"大塚"}
    last_name {"一生"}
    kana_first {"オオツカ"}
    kana_last {"イッセイ"}
    birth_id {"1991-05-30"}
  end
end