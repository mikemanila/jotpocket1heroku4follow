class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.string :color
      t.string :description
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
    add_index :themes, [:user_id, :created_at]
    add_index :themes, [:category_id, :created_at]
  end
end
