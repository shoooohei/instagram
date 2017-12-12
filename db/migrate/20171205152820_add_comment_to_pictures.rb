class AddCommentToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :comment, :text
  end
end
