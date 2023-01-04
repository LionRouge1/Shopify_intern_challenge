class Item < ApplicationRecord
  has_one :deleted_item, dependent: :destroy
  has_many :items_warehouses, dependent: :destroy

  validates :item_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :category, presence: true, length: { minimum: 2, maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
