require 'test_helper'

class UserIconsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_icons_new_url
    assert_response :success
  end

  test "should get create" do
    get user_icons_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_icons_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_icons_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_icons_destroy_url
    assert_response :success
  end

end
