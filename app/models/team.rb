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

  def front_nine_score(other_team)

    score = 0
    streak = 0
    (1..8).each do |hole_number|
      if low_score_for_hole(hole_number) < other_team.low_score_for_hole(hole_number)
        streak += 1
        if streak == 2
          score += 1
          streak = 0
        end
      end
      if low_score_for_hole(hole_number) > other_team.low_score_for_hole(hole_number)
        streak -= 1
        if streak == -2
          score -= 1
          streak = 0
        end
      end
    end

    if score>0
      if low_score_for_hole(9) < other_team.low_score_for_hole(9)
        return 2*score
      end
      if low_score_for_hole(9) > other_team.low_score_for_hole(9)
        return 0
      end
    end
    if score<0
      if low_score_for_hole(9) > other_team.low_score_for_hole(9)
        return 2*score
      end
      if low_score_for_hole(9) < other_team.low_score_for_hole(9)
        return 0
      end
    end

    score
  end

end
