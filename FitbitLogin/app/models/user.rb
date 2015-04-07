class User < ActiveRecord::Base
	has_many :authorizations
	has_many :steps
	has_many :calories
	has_many :distances

	def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
  		user.oauthToken = auth['credentials']['token']
        user.oauthSecret = auth['credentials']['secret']
	  end
	end

	def self.update_name(user, client)
		User.find(user) do |x|
			info = client.user_info['user']
			x.update_attribute(:name, info["displayName"])
		end
	end
end
