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

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations
  has_many :likes, dependent: :delete_all

  validates :body, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

  # has_one_attached :image
  mount_uploader :image, ImageUploader

  def self.search(search)
    return all unless search
    where(['body like ?', "%#{search}%"])
  end

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
end
