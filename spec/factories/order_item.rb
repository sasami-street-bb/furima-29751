FactoryBot.define do
  factory :order_item do
    postal_code {"123-4567"}
    city {"海"}
    house_number {"山"}
    phone_number {"12345678900"}
    prefecture_id {Faker::Number.within(range: 1..47)}
    user_id {1}
    item_id {1}
    token {"1qaz"}
  end
end