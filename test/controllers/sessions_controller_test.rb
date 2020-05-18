require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    # get sessions_neを書き換え
    get login_path
    assert_response :success
  end

end
