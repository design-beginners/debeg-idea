class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :idea, index: true
      t.text :body

      t.timestamps
    end
  end
end
