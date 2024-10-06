FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "qwerty" }

    traits_for_enum :role
  end
end
