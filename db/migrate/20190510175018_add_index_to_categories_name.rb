class AddIndexToCategoriesName < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :name

    add_index :states, :id
  end
end
