require 'test_helper'

class CaloryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without calorieDate" do
  		calorie = Calorie.new
  		assert_not( calorie.save, "saved without calorieDate")
	end
end
