class AddIndexToOffers < ActiveRecord::Migration[5.2]
  def change
    add_index :offers, [:category_id, :city_id, :state_id]

  end
end
