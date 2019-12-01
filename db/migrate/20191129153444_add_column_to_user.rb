class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sex, :integer
    add_column :users, :sweet_tooth, :integer
  end
end
