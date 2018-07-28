json.extract! user, :id, :sender_number, :pass_code, :time, :service_provider, :created_at, :updated_at
json.url user_url(user, format: :json)
