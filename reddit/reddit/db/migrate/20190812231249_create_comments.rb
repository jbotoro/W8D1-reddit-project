class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.index :post_id
      t.index :user_id
      t.index :content
      t.timestamps
    end
  end
end
