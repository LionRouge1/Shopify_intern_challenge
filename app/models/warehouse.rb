class Warehouse < ApplicationRecord
  has_many :items_warehouses, dependent: :destroy

  validates :address, presence: true, length: { minimum: 2, maximum: 150 }
  validates :country, presence: true, length: { minimum: 2, maximum: 100 }
  validates :city, presence: true, length: { minimum: 2, maximum: 100 }
end
