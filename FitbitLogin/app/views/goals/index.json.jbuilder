json.array!(@goals) do |goal|
  json.extract! goal, :id, :goalName, :timeFrame, :goalAmount
  json.url goal_url(goal, format: :json)
end
