class AddIndexToOffersDate < ActiveRecord::Migration[5.2]
  def change
    add_index :offers, :date, unique: false
  end
end
