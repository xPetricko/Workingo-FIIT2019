class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :code
      t.string :name
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
