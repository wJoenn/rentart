require "test_helper"

class ArtsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arts_index_url
    assert_response :success
  end

  test "should get new" do
    get arts_new_url
    assert_response :success
  end

  test "should get create" do
    get arts_create_url
    assert_response :success
  end
end
