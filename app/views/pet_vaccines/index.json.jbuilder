json.array!(@pet_vaccines) do |pet_vaccine|
  json.extract! pet_vaccine, :id, :pet_id, :vaccine_id, :apply_at
  json.url pet_vaccine_url(pet_vaccine, format: :json)
end
