class RemoveImageFromUserIcon < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_icons, :image
    add_column :user_icons, :image, :text, default: 'default_user_img.png'
  end
end
