json.array!(@profiles) do |profile|
  json.extract! profile, :id, :userName, :userAge, :userGender, :userHeight, :userWeight
  json.url profile_url(profile, format: :json)
end
