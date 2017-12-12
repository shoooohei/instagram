class CreateUserIcons < ActiveRecord::Migration[5.1]
  def change
    create_table :user_icons do |t|

      t.timestamps
    end
  end
end
