class AddWageToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :active, :boolean, default: TRUE
    add_column :offers, :wage, :integer
  end
end
