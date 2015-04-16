require 'test_helper'

class StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "should not save user without stepDate" do
  		step = Step.new
  		assert_not( step.save, "saved without stepDate")
	end
end
