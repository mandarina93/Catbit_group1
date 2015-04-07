json.array!(@distances) do |distance|
  json.extract! distance, :id, :distanceAmount, :distanceDate
  json.url distance_url(distance, format: :json)
end
