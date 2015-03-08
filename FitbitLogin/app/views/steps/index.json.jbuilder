json.array!(@steps) do |step|
  json.extract! step, :id, :day, :amount
  json.url step_url(step, format: :json)
end
