class DeletedItem < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: :item_id

  validates :description, presence: true, length: { minimum: 2, maximum: 250 }
end
