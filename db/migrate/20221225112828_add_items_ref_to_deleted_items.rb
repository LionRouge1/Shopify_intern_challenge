class AddItemsRefToDeletedItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :deleted_items, :item, null: false, foreign_key: true
  end
end
