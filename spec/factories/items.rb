FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    description {Faker::Lorem.sentence}
    price {Faker::Number.number(digits: 6)}
    category_id {Faker::Number.within(range: 1..2)}
    condition_id {Faker::Number.within(range: 1..2)}
    shipping_fee_id	{Faker::Number.within(range: 1..2)}
    prefecture_id {Faker::Number.within(range: 1..2)}
    shipping_date_id {Faker::Number.within(range: 1..2)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'test_image.png')
    end
  end
end
