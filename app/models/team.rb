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
end
