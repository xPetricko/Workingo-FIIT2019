class AddNameToAcceptedOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :accepted_offers, :name, :string
  end
end
