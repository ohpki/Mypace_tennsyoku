require "test_helper"

class Employer::NursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employer_nurses_show_url
    assert_response :success
  end

  test "should get index" do
    get employer_nurses_index_url
    assert_response :success
  end
end
