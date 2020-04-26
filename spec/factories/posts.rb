# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  user_id    :integer
#  image      :string(255)
#  evaluation :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
    factory :post do
        body { 'テスト投稿' }
        user
    end
end
