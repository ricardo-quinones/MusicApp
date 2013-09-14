class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.boolean :admin, default: false
      t.boolean :activation_status, default: false
      t.string :activation_token

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
    add_index :users, :admin
    add_index :users, :activation_token
  end
end
