# == Schema Information
#
# Table name: competitors
#
#  id         :integer          not null, primary key
#  golfer_id  :integer
#  handicap   :integer
#  created_at :datetime
#  updated_at :datetime
#  game_id    :integer
#

require 'test_helper'

class CompetitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
