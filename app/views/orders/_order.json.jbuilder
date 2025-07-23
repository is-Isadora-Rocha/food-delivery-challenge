json.extract! order, :id, :pickup_address, :delivery_address, :items_description, :requested_at, :estimated_price, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
