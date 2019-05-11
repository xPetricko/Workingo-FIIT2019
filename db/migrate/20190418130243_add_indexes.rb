class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :cities, :name
   rename_column :states, :label, :name
    add_index :states, :name, unique: true
    add_index :provinces, :name
  end
end
