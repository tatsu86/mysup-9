class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :introduction
      t.date :birthday
      t.string :email, null: false
      t.string :unique_id, null: false
      t.string :image
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
