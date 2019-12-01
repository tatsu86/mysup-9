# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  introduction    :string(255)
#  birthday        :date
#  email           :string(255)      not null
#  unique_id       :string(255)      not null
#  image           :string(255)
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sex             :integer
#  sweet_tooth     :integer
#  favorite1       :string(255)
#  favorite2       :string(255)
#  favorite3       :string(255)
#

class User < ApplicationRecord
    has_many :posts, dependent: :delete_all

    has_secure_password
    validates :name,
      presence: true
    validates :email,
      presence: true,
      uniqueness: true,
      length: { maximum: 255 }
    validates :password,
      length: { minimum: 8 }, allow_nil: true

    enum sex: {
      男性:1,女性:2
    }
end
