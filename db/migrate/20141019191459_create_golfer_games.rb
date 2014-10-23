class CreateGolferGames < ActiveRecord::Migration
  def change
    create_table :golfer_games do |t|
      t.references :golfer, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
