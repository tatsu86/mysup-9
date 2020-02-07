FactoryBot.define do
    factory :user do
        sequence(:name) { |n| "テストユーザー#{n}" }
        sequence(:email) { |n| "test#{n}@gmail.com" }
        password { 'password' }
        sequence(:unique_id) { |n| "test_#{n}" }
    end
end