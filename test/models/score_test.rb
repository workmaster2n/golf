# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  golfer_id  :integer
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  strokes    :integer
#  hole_id    :integer
#

require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
