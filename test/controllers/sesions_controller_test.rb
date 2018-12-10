require 'test_helper'

class SesionsControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get sesions_admin_url
    assert_response :success
  end

end
