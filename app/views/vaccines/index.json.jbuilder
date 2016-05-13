json.array!(vaccines) do |vaccine|
  json.extract! vaccine, :id, :name, :periodicity
  json.url vaccine_url(vaccine, format: :json)
end
