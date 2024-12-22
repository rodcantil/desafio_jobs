json.extract! offer, :id, :title, :image, :description, :user_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)
