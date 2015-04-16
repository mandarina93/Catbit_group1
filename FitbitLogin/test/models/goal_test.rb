require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without goalName" do
  		goal = Goal.new
  		assert_not( goal.save, "saved without goalName")
	end
end
