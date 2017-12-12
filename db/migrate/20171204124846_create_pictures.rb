class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.text :images
      t.text :comment

      t.timestamps
    end
  end
end
