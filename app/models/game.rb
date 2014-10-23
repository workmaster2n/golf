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

class Game < ActiveRecord::Base
  belongs_to :course
  has_many :competitors
  has_many :golfers, through: :competitors
  has_many :scores

  accepts_nested_attributes_for :competitors
end
