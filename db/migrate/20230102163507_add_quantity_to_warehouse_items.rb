class AddQuantityToWarehouseItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items_warehouses, :quantity, :integer
  end
end
