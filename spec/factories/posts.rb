FactoryBot.define do
    factory :post do
        body { 'テスト投稿' }
        user
    end
end