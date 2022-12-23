class Item < ApplicationRecord

    validates :item_name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :category, presence: true, length: { minimum: 2, maximum: 50 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
