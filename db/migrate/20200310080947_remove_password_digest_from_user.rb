class RemovePasswordDigestFromUser < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :password_digest
  end

  def down
    add_column :users, :password_digest, :string, null: false
  end
end
