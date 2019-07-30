FactoryBot.define do
  Faker::Config.locale = :ja
  factory :item do
    name               {'Tシャツ'}
    description        {Faker::Lorem.paragraph}
    item_status        {Faker::Number.between(0, 5)}
    delivery_fee       {Faker::Number.between(0, 1)}
    delivery_method    {Faker::Number.between(0, 8)}
    delivery_date      {Faker::Number.between(0, 2)}
    prefecture         {Faker::Number.between(0, 47)}
    price              {Faker::Number.between(300, 9999999)}
    transaction_status {Faker::Number.between(0, 2)}
    seller_id          {1}
    buyer_id           {1}
    category_id        {1}
  end
end
