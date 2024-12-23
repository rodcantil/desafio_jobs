FactoryBot.define do
  factory :user do
    name { "Admin User" }
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    role { "admin" }

    trait :admin do
      role { "admin" }
    end
  end
end
