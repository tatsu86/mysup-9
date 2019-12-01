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

require 'rails_helper'

RSpec.describe PostTagRelation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
