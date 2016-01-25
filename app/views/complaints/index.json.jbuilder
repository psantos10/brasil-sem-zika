json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :address, :cep, :state_id, :city_id
  json.url complaint_url(complaint, format: :json)
end
