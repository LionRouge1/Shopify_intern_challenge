class WarehouseItem < ApplicationRecord
  belongs_to :item
  belongs_to :warehouse

  validates :quantity, presence: true
  validates :warehouse_id, uniqueness: { scope: :item_id }

  scope :ordered, -> { order(id: :desc) }

  after_create_commit lambda {
    broadcast_append_to 'warehouse_items',
                        partilal: 'warehouse_items/warehouse_item',
                        locals: { warehouse_item: self },
                        target: 'warehouse_items'
  }
end
