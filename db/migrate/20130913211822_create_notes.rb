class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :track_id, null: false

      t.timestamps
    end
    add_index :notes, :body
    add_index :notes, :track_id
  end
end
