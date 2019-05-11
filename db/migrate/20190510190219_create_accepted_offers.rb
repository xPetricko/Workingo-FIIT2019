class CreateAcceptedOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :accepted_offers do |t|

      t.timestamps
      t.references :offer, foreign_key: true
      t.string :contact
    end
  end
end
