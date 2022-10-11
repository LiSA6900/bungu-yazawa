require "test_helper"

class Public::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new,index," do
    get public_inquiries_new,index,_url
    assert_response :success
  end

  test "should get show" do
    get public_inquiries_show_url
    assert_response :success
  end
end
