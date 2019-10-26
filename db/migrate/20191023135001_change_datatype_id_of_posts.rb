class ChangeDatatypeIdOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :id, :bigint, auto_increment: true
  end
end
