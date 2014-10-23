# == Schema Information
#
# Table name: scores
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  strokes       :integer
#  hole_id       :integer
#  competitor_id :integer
#

require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
