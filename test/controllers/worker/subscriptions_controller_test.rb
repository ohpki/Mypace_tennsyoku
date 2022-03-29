require "test_helper"

class Worker::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get worker_subscriptions_new_url
    assert_response :success
  end

  test "should get create" do
    get worker_subscriptions_create_url
    assert_response :success
  end

  test "should get index" do
    get worker_subscriptions_index_url
    assert_response :success
  end

  test "should get show" do
    get worker_subscriptions_show_url
    assert_response :success
  end

  test "should get edit" do
    get worker_subscriptions_edit_url
    assert_response :success
  end

  test "should get update" do
    get worker_subscriptions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get worker_subscriptions_destroy_url
    assert_response :success
  end
end
