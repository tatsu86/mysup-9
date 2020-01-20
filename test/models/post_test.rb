# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  user_id    :integer
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  evaluation :float(53)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
