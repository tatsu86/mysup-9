# == Schema Information
#
# Table name: post_tag_relations
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_tag_relations_on_post_id  (post_id)
#  index_post_tag_relations_on_tag_id   (tag_id)
#

require 'rails_helper'

RSpec.describe PostTagRelation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
