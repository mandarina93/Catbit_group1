class User < ActiveRecord::Base
	has_many :authorizations
	has_many :steps
	validates :email, presence: true, uniqueness: true
			
	def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.oauthToken = auth['credentials']['token']
      user.oauthSecret = auth['credentials']['secret']
	  end
	end
end
