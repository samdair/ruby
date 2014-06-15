json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :image_url, :category, :price
  json.url product_url(product, format: :json)
end
