require "test_helper"

class ExceptionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get exception_show_url
    assert_response :success
  end
end
