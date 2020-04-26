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
#  sex                    :integer
#  favorite1              :string(255)
#  favorite2              :string(255)
#  favorite3              :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Post関連
  has_many :posts, dependent: :delete_all
  # Like関連
  has_many :likes, dependent: :delete_all
  # Comment関連
  has_many :comments, dependent: :delete_all
  # Relationship関連
  has_many :relationships, dependent: :delete_all
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: :'Relationship', foreign_key: 'follow_id', dependent: :delete_all
  has_many :followers, through: :reverse_of_relationships, source: :user

  # has_one_attached :image
  mount_uploader :image, ImageUploader
  # devise導入する場合は、has_secure_passwordが不要
  # has_secure_password

  validates :name, presence: true, length: { maximum: 20 }

  MAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: MAIL_FORMAT }

  # 6文字以上
  validates :password, length: { minimum: 6 }, allow_nil: true

  # 英数字、アンダースコアのみ許容
  ID_FORMAT = /\A[a-zA-Z0-9_]+\z/.freeze
  validates :unique_id, presence: true, uniqueness: true, length: { maximum: 20 } , format: { with: ID_FORMAT }

  enum sex: { 男性:1,女性:2 }

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
