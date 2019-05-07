class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :offers, :categories
  end
end
