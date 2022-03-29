require "test_helper"

class Employer::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employer_subscriptions_index_url
    assert_response :success
  end
end
