json.array!(@children) do |child|
  json.extract! child, :id, :fname, :lname, :dob
  json.url child_url(child, format: :json)
end
