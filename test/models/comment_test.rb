# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  post_id           :integer          not null
#  comment           :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  parent_comment_id :integer
#  unique_id         :string(255)      not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
