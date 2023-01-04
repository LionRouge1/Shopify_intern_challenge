class CreateJoinTableWarehouseItem < ActiveRecord::Migration[7.0]
  def change
    create_join_table :warehouses, :items do |t|
      # t.index [:warehouse_id, :item_id]
      # t.index [:item_id, :warehouse_id]
    end
  end
end
