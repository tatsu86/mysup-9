# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  comment    :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :post
  
    validates :comment, presence: true, length: { maximum: 255 }
    validates :user_id, presence: true
end
