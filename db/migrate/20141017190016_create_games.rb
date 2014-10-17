class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :course_id
      t.date :played_on

      t.timestamps
    end
  end
end
