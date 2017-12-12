class RemoveCommentFromPicture < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :comment
  end
end
