class TeamCompetitor < ActiveRecord::Base
  belongs_to :team
  belongs_to :competitor
end
