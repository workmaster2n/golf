# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  swing      :boolean          default(FALSE)
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  belongs_to :game

  has_many :team_competitors
  has_many :competitors, through: :team_competitors

  def low_score_for_hole(number)
    scores = competitors.map do |competitor|
      competitor.scores.map do |score|
        score.strokes if score.hole.number == number
      end
    end
    scores.flatten.min
  end
end
