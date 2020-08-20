require 'test_helper'

class CampaingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campaings_index_url
    assert_response :success
  end

  test "should get show" do
    get campaings_show_url
    assert_response :success
  end

end
