require 'test_helper'

class EmployeeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employee_new_url
    assert_response :success
  end

  test "should get show" do
    get employee_show_url
    assert_response :success
  end

  test "should get update" do
    get employee_update_url
    assert_response :success
  end

  test "should get destroy" do
    get employee_destroy_url
    assert_response :success
  end

end
