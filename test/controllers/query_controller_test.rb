require 'test_helper'

class QueryControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get query_get_url
    assert_response :success
  end

end
