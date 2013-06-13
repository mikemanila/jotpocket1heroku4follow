class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :content
      t.string :reference
      t.integer :theme_id
      t.integer :user_id

      t.timestamps
    end
    add_index :pieces, [:user_id, :created_at]
    add_index :pieces, [:theme_id, :created_at]
  end
end
