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

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'low score' do
    team = Team.new
    game = Game.new
    course = Course.new
    course.holes << Hole.new(number: 1)

    game.course = course

    team.game = game

    golfer1 = Golfer.new
    golfer2 = Golfer.new


    competitor1 = team.competitors.new(golfer: golfer1, game: game)
    competitor2 = team.competitors.new(golfer: golfer2, game: game)

    team.competitors.each do |competitor|
      competitor.create_scores
    end

    competitor1.set_score_for_hole(1,1)
    competitor2.set_score_for_hole(1,2)

    assert_equal(1, team.low_score_for_hole(1))
  end
end
