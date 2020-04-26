class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :body
      t.integer :user_id
      t.string :image
      t.float :evaluation

      t.timestamps
    end
  end
end
