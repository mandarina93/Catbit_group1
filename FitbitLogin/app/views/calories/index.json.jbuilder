json.array!(@calories) do |calory|
  json.extract! calory, :id, :calorieDate, :calorieIn, :calorieOut
  json.url calory_url(calory, format: :json)
end
