class Distance < ActiveRecord::Base
	belongs_to :user
	
	def self.distance_data(data, user)
      where(user_id: user, distanceDate: Date.today).first_or_create do |distance|
        distance.distanceAmount = data["distances"][0]["distance"]
		distance.distanceDate = Date.today
	  end
	end
	
	def self.refresh(user, client)
	  Distance.where(user_id: user).find_each do |x|
		info = client.activities_on_date(x.distanceDate)
		x.update_attribute(:distanceAmount, info["summary"]["distances"][0]["distance"])
	  end
	end
end
