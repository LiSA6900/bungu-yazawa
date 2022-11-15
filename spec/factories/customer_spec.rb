FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email}
    password { ["Abcdef","Skijeh","skdjVaa"].sample}
    last_name { Faker::Lorem.characters(number:5)}
    first_name { Faker::Lorem.characters(number:5)}
    last_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana}
    postal_code {  ["1234567","2736582","9635874"].sample}
    address { Faker::Lorem.characters(number:5)}
    telephone_number { ["08012345678","0802736582","0809635874"].sample}
    is_deleted { Faker::Lorem.characters(number:5)}
  end
end
