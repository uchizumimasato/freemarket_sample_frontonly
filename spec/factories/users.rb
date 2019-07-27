FactoryBot.define do
  Faker::Config.locale = :ja

  factory :user do
    password = Faker::Internet.password(8)

    nickname              {Faker::Name.name}
    name                  {Gimei.name.kanji}
    name_kana             {Gimei.name.katakana}
    email                 {Faker::Internet.email}
    password              {password}
    password_confirmation {password}
    postal_code           {Faker::Address.postcode}
    prefecture            {Faker::Number.between(1, 47)}
    city                  {Faker::Address.city}
    address               {"1-1"}
  end

end
