require 'test_helper'

class InstanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instance_index_url
    assert_response :success
  end

end
