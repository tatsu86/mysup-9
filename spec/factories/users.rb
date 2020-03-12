# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      not null
#  introduction           :string(255)
#  birthday               :date
#  email                  :string(255)      not null
#  unique_id              :string(255)      not null
#  image                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sex                    :integer
#  sweet_tooth            :integer
#  favorite1              :string(255)
#  favorite2              :string(255)
#  favorite3              :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
    factory :user do
        sequence(:name) { |n| "テストユーザー#{n}" }
        sequence(:email) { |n| "test#{n}@gmail.com" }
        password { 'password' }
        sequence(:unique_id) { |n| "test#{n}" }
    end
end
