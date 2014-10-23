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

class Score < ActiveRecord::Base
  belongs_to :competitor
  belongs_to :hole
end
