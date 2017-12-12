class CreateOtherComments < ActiveRecord::Migration[5.1]
  def change
    create_table :other_comments do |t|
      t.integer :picture_id
      t.integer :user_id
      t.text :other_comment

      t.timestamps
    end
  end
end
