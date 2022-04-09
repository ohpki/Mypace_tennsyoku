require "test_helper"

class Admin::HospitlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_hospitls_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_hospitls_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_hospitls_destroy_url
    assert_response :success
  end
end
