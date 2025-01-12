FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name             {"花子"}
    family_name            {"鈴木"}
    first_name_kana         {"ハナコ"}
    family_name_kana       {"スズキ"}
    birthday                {Faker::Date.backward}
  end
end