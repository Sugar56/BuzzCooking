require "test_helper"

class User::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_tags_index_url
    assert_response :success
  end
end
