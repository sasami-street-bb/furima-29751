FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password  {"aaa111"}
    password_confirmation {password}
    last_name {"佐藤"}
    first_name {"一郎"}
    last_name_kana {"サトウ"}
    first_name_kana {"イチロウ"}
    birthday {Faker::Date.birthday(min_age: 4 , max_age: 150)}
  end
end