class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :likable_id, null: false
      t.string  :likable_type, null: false
      t.timestamps
    end

    add_index :likes, [:likable_id, :likable_type]
    add_index :likes, [:user_id, :likable_id, :likable_type], unique: true
  end
end
