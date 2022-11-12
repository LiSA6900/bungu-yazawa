FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email}
    password { Faker::Lorem.characters(number:6)}
    last_name { Faker::Lorem.characters(number:5)}
    first_name { Faker::Lorem.characters(number:5)}
    last_name_kana { Faker::Lorem.characters(number:5)}
    first_name_kana { Faker::Lorem.characters(number:5)}
    postal_code { Faker::Lorem.characters(number:5)}
    address { Faker::Lorem.characters(number:5)}
    telephone_number { Faker::Lorem.characters(number:5)}
    is_deleted { Faker::Lorem.characters(number:5)}
  end
end