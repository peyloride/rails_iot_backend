json.extract! sensor, :id, :name, :type, :address, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)