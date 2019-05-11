class AddCodeToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :code, :string
  end
end
