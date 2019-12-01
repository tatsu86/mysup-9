class AddColumnFavoriteToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite1, :string
    add_column :users, :favorite2, :string
    add_column :users, :favorite3, :string
  end
end
