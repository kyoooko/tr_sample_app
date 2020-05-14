require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
    # get root_urlを書き換え
    get root_path
    assert_response :success
    # assert_select "title", "Home | #{@base_title}"
  end

  # test "should get home" do
  #   get static_pages_home_url
  #   assert_response :success
  #   assert_select "title", "Ruby on Rails Tutorial Sample App"
  # end

  test "should get help" do
    # get static_pages_help_urlを書き換え
    get help_path
    # 演習 get helf_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    # get static_pages_about_urlを書き換え
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end


  test "should get contact" do
    # get static_pages_contact_urlを書き換え
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end


end