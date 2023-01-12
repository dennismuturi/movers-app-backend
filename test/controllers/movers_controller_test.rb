require "test_helper"

class MoversControllerTest < ActionDispatch::IntegrationTest
  test "should get mover" do
    get movers_mover_url
    assert_response :success
  end
end
