json.array!(@notes) do |note|
  json.extract! note, :id, :text, :reviewed_at
  json.url note_url(note, format: :json)
end
