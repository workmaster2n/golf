class AddStrokesAndHoleToScores < ActiveRecord::Migration
  def change
    add_column :scores, :strokes, :integer
    add_column :scores, :hole_id, :integer
  end
end
