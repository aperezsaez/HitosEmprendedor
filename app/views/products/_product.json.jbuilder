json.extract! product, :id, :name, :price, :stock, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
