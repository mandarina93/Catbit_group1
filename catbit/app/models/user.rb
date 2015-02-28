class User < ActiveRecord::Base
	has_one :profiles
end
