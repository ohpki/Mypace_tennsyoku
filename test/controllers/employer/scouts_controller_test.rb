require "test_helper"

class Employer::ScoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employer_scouts_new_url
    assert_response :success
  end

  test "should get create" do
    get employer_scouts_create_url
    assert_response :success
  end

  test "should get index" do
    get employer_scouts_index_url
    assert_response :success
  end

  test "should get destroy" do
    get employer_scouts_destroy_url
    assert_response :success
  end
end
