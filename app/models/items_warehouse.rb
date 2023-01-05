class ItemsWarehouse < ApplicationRecord
  belongs_to :item
  belongs_to :warehouse

  validates :quantity, presence: true
  validates :warehouse_id, uniqueness: { scope: :item_id }
end
