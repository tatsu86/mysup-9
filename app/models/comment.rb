class Comment < ApplicationRecord
    belongs_to :post
  
    validates :comment, presence: true, length: { maximum: 255 }
    validates :user_id, presence: true
end