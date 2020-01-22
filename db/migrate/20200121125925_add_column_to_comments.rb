class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :parent_comment_id, :integer
    add_column :comments, :unique_id, :string, null: false
  end
end
