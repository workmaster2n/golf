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

class Score < ActiveRecord::Base
  belongs_to :golfer
  belongs_to :game
  belongs_to :hole
end
