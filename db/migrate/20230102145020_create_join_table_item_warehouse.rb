class CreateJoinTableItemWarehouse < ActiveRecord::Migration[7.0]
  def change
    create_join_table :items, :warehouses do |t|
      # t.index [:item_id, :warehouse_id]
      # t.index [:warehouse_id, :item_id]
    end
  end
end
