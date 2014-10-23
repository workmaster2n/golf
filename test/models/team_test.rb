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
    team = Team.create
    game = Game.create
    course = Course.create
    course.holes << Hole.create(number: 1)

    game.course = course

    team.game = game

    golfer1 = Golfer.create
    golfer2 = Golfer.create


    competitor1 = team.competitors.create(golfer: golfer1, game: game)
    competitor2 = team.competitors.create(golfer: golfer2, game: game)

    team.competitors.each do |competitor|
      competitor.create_scores
    end

    competitor1.set_score_for_hole(1,1)
    competitor2.set_score_for_hole(1,2)

    assert_equal(1, team.low_score_for_hole(1))
  end
end
