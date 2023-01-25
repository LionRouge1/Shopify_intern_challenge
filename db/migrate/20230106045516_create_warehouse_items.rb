class CreateWarehouseItems < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_items do |t|
      t.integer :quantity
      t.references :warehouse, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
