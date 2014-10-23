class AddGameIdToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :game_id, :integer
  end
end
