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

class Competitor < ActiveRecord::Base
  belongs_to :golfer
  belongs_to :game
  has_many :scores
end
