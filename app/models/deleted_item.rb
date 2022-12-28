class DeletedItem < ApplicationRecord
  belongs_to :item, class_name: 'Item', foreign_key: :item_id

  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
  validates :item_id, uniqueness: { message: 'Item already deleted' }
end
