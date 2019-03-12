require 'test_helper'

class TrainerControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get trainer_feed_url
    assert_response :success
  end

end
