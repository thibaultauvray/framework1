require 'test_helper'

class TopicControllerTest < ActionController::TestCase
  test "should get savetopoc" do
    get :savetopoc
    assert_response :success
  end

  test "should get newtopic" do
    get :newtopic
    assert_response :success
  end

end
