class AddColumnToUserIcons < ActiveRecord::Migration[5.1]
  def change
    add_column :user_icons, :user_id, :integer
    add_column :user_icons, :image, :text
  end
end
