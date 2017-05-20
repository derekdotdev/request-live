require 'test_helper'

class TonightControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tonight_index_url
    assert_response :success
  end

end
