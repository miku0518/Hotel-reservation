require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get account" do
    get users_account_url
    assert_response :success
  end

  test "should get edit_account" do
    get users_edit_account_url
    assert_response :success
  end

  test "should get update_account" do
    get users_update_account_url
    assert_response :success
  end
end
