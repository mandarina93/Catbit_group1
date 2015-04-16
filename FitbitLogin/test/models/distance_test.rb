require 'test_helper'

class DistanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without distanceDate" do
  		distance = Distance.new
  		assert_not( distance.save, "saved without distanceDate")
	end
end
