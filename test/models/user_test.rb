# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  introduction    :string(255)
#  birthday        :date
#  email           :string(255)      not null
#  unique_id       :string(255)      not null
#  image           :string(255)
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sex             :integer
#  sweet_tooth     :integer
#  favorite1       :string(255)
#  favorite2       :string(255)
#  favorite3       :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
