json.array!(@journals) do |journal|
  json.extract! journal, :id, :child_id, :day, :subject, :memo, :date
  json.url journal_url(journal, format: :json)
end
