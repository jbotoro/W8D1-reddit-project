class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :content
      t.integer :user_id, null: false
      t.integer :sub_id, null: false

      t.index :user_id
      t.index :sub_id
      t.timestamps
    end
  end
end
