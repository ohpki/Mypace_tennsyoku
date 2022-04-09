require "test_helper"

class Admin::NursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_nurses_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_nurses_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_nurses_destroy_url
    assert_response :success
  end
end
