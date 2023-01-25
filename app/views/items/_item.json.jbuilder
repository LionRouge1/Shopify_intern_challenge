json.extract! item, :id, :item_name, :category, :expire_at, :created_at, :updated_at
json.url item_url(item, format: :json)
