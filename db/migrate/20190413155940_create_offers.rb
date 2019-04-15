class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :offers, [:user_id, :created_at]
  end
end
