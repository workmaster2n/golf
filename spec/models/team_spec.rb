require 'rails_helper'

describe Team do
  it 'low score for hole' do
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

    competitor1.set_score_for_hole(1, 1)
    competitor2.set_score_for_hole(1, 2)

    expect(team.low_score_for_hole(1)).to eq(1)
  end

  it 'regular team wins front 9' do
    regular_team = Team.new
    swing_team = Team.new

    allow(regular_team).to receive(:low_score_for_hole).with(1) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(2) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(3) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(4) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(5) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(6) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(7) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(8) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(9) {1}
    allow(swing_team).to receive(:low_score_for_hole).with(1) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(2) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(3) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(4) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(5) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(6) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(7) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(8) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(9) {2}

    expect(regular_team.front_nine_score(swing_team)).to eq(8)
    expect(swing_team.front_nine_score(regular_team)).to eq(-8)
  end

  it 'regular team wins 8 but loses 9' do
    regular_team = Team.new
    swing_team = Team.new

    allow(regular_team).to receive(:low_score_for_hole).with(1) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(2) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(3) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(4) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(5) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(6) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(7) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(8) {1}
    allow(regular_team).to receive(:low_score_for_hole).with(9) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(1) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(2) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(3) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(4) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(5) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(6) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(7) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(8) {2}
    allow(swing_team).to receive(:low_score_for_hole).with(9) {1}

    expect(regular_team.front_nine_score(swing_team)).to eq(0)
    expect(swing_team.front_nine_score(regular_team)).to eq(0)
  end
end