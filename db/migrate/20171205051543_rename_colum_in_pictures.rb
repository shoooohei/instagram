class RenameColumInPictures < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :images, :image
  end
end
