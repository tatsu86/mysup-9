class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :delete_all
    has_many :post_tag_relations, dependent: :delete_all
    has_many :tags, through: :post_tag_relations
    
    validates :body, presence: true, length: { maximum: 255 }
    validates :user_id, presence: true

    # has_one_attached :image

    def self.search(search)
        return all unless search
        where(['body like ?', "%#{search}%"])
    end
end
