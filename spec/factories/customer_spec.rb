FactoryBot.define do
  factory :customer do
    email { Faker::Lorem}
    password { Faker::Lorem}
    last_name { Faker::Lorem}
    first_name { Faker::Lorem}
    last_name_kana { Faker::Lorem}
    first_name_kana { Faker::Lorem}
    postal_code { Faker::Lorem}
    address { Faker::Lorem}
    telephone_number { Faker::Lorem}
    is_deleted { Faker::Lorem}
  end
end
