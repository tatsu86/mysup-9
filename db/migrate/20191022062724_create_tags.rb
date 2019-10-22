class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :sort

      t.timestamps
    end
  end
end
