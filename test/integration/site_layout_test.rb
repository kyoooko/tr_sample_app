require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    # 演習で下記追加
    get contact_path
    assert_select "title", full_title("Contact")

    # 5-4演習で下記追加
    get signup_path
    assert_select "title", full_title("Sign up")
  end

end
