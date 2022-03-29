require "test_helper"

class Employer::HospitalsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employer_hospitals_show_url
    assert_response :success
  end

  test "should get edit" do
    get employer_hospitals_edit_url
    assert_response :success
  end

  test "should get update" do
    get employer_hospitals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get employer_hospitals_destroy_url
    assert_response :success
  end

  test "should get quit" do
    get employer_hospitals_quit_url
    assert_response :success
  end
end
