class AddSateToOffers < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :state, foreign_key: true
    add_reference :offers, :city, foreign_key: true

  end
end
