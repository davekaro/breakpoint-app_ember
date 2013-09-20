class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.datetime :date
      t.integer :singles_matches
      t.integer :doubles_matches

      t.timestamps
    end
  end
end
