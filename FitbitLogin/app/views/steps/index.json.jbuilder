json.array!(@steps) do |step|
  json.extract! step, :id, :stepDate, :stepAmount
  json.url step_url(step, format: :json)
end
