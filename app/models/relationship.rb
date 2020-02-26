# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  follow_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_relationships_on_follow_id              (follow_id)
#  index_relationships_on_user_id                (user_id)
#  index_relationships_on_user_id_and_follow_id  (user_id,follow_id) UNIQUE
#

class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'

  validates :user_id, presence: true
  validates :follow_id, presence: true
end
