require "test_helper"

class Admin::SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get admin_schedules_index,_url
    assert_response :success
  end

  test "should get show," do
    get admin_schedules_show,_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_schedules_destroy_url
    assert_response :success
  end
end
