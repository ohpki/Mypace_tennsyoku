require "test_helper"

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get send_mail" do
    get report_send_mail_url
    assert_response :success
  end
end
