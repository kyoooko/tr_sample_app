require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do

    # 5-4-2でget users_new_urlを下記に書き換え
    get signup_path
    assert_response :success
  end

end
