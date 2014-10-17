# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  played_on  :date
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
