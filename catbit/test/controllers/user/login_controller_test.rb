require 'test_helper'

class User::LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
