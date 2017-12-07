json.extract! event, :id, :title, :description, :address, :neighborhood, :city, :state, :cep, :eventdate, :eventtime, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
