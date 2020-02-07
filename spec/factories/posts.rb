FactoryBot.define do
    factory :task do
        body { 'テスト投稿' }
        user_id { '1' }
        user
    end
end