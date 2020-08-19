require 'test_helper'

class ChefControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chef_new_url
    assert_response :success
  end

  test "should get show" do
    get chef_show_url
    assert_response :success
  end

  test "should get update" do
    get chef_update_url
    assert_response :success
  end

  test "should get destroy" do
    get chef_destroy_url
    assert_response :success
  end

end
