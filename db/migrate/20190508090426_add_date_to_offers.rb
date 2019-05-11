class AddDateToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :label, :string
    add_column :offers, :date, :date

  end
end
