class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.boolean :swing, default: :false
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
