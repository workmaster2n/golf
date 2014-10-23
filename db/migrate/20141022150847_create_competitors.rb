class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.belongs_to :golfer, index: true
      t.integer :handicap

      t.timestamps
    end
  end
end
