json.array!(@grades) do |grade|
  json.extract! grade, :id, :child_id, :title, :grade, :date
  json.url grade_url(grade, format: :json)
end
