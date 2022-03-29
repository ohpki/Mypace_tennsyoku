require "test_helper"

class Employer::JobInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employer_job_informations_new_url
    assert_response :success
  end

  test "should get create" do
    get employer_job_informations_create_url
    assert_response :success
  end

  test "should get index" do
    get employer_job_informations_index_url
    assert_response :success
  end

  test "should get show" do
    get employer_job_informations_show_url
    assert_response :success
  end

  test "should get edit" do
    get employer_job_informations_edit_url
    assert_response :success
  end

  test "should get update" do
    get employer_job_informations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get employer_job_informations_destroy_url
    assert_response :success
  end
end
