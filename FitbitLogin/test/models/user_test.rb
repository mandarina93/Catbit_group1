require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "should not save user without uid, oauthToken, or oauthSecret" do
  		user = User.new
  		assert_not( user.save, "saved without uid, oauthToken, or oauthSecret")
	end
end
