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
end