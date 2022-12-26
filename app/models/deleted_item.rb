class DeletedItem < ApplicationRecord
  belongs_to :item

  validates :description, presence: true, length: { minimum: 2, maximum: 250 }
end
