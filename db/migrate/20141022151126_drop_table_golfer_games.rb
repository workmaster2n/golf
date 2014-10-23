class DropTableGolferGames < ActiveRecord::Migration
  def change
    drop_table :golfer_games
  end
end
