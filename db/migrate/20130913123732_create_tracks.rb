class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :length_in_seconds, null: false
      t.integer :track_number
      t.integer :album_id, null: false
      t.string :bonus, null: false

      t.timestamps
    end
    add_index :tracks, :name
    add_index :tracks, :album_id
  end
end
