class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
