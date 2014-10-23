class RemoveGolferIdAndGameIdFromScores < ActiveRecord::Migration
  def change
    remove_column :scores, :golfer_id
    remove_column :scores, :game_id
    add_column :scores, :competitor_id, :integer
  end
end
