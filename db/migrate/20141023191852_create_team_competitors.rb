class CreateTeamCompetitors < ActiveRecord::Migration
  def change
    create_table :team_competitors do |t|
      t.belongs_to :team, index: true
      t.belongs_to :competitor, index: true

      t.timestamps
    end
  end
end
