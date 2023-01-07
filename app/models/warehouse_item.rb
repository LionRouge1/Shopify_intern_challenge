class WarehouseItem < ApplicationRecord
  belongs_to :item
  belongs_to :warehouse

  validates :quantity, presence: true
  validates :warehouse_id, uniqueness: { scope: :item_id }

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit lambda {
  #   broadcast_append_to 'warehouse_items',
  #                       partilal: 'warehouse_items/warehouse_item',
  #                       locals: { warehouse_item: self },
  #                       target: 'warehouse_items'
  # }

  # after_create_commit -> { broadcast_append_to 'warehouse_items' }
  # after_update_commit -> { broadcast_replace_to 'warehouse_items' }
  # after_destroy_commit -> { broadcast_remove_to 'warehouse_items' }

  # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(_warehouse_item) { 'warehouse_items' }, inserts_by: :prepend
end
