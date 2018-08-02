require 'test_helper'

class BeastControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get beast_post_url
    assert_response :success
  end

  test "should get get" do
    get beast_get_url
    assert_response :success
  end

end
