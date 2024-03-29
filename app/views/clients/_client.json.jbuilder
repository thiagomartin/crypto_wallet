json.extract! client, :id, :name, :age, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
