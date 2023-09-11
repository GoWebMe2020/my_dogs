require "test_helper"

class DogControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dog_show_url
    assert_response :success
  end

  test "should get dog" do
    get dog_dog_url
    assert_response :success
  end
end
