class AddPhotoToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :photo_file_name, :string
    add_column :pieces, :photo_content_type, :string
    add_column :pieces, :photo_file_size, :string
  end
end
