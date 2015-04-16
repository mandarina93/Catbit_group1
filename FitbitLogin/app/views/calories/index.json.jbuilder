json.array!(@calories) do |calories|
  json.extract! calories, :id, :calorieDate, :calorieIn, :calorieOut
  json.url calories_url(calories, format: :json)
end
