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

  has_many :team_competitors
  has_many :teams, through: :team_competitors

  accepts_nested_attributes_for :scores

  after_create :create_scores

  private

  def create_scores
    game.course.holes.each do |hole|
      scores.create(hole_id: hole.id)
    end
  end
end
