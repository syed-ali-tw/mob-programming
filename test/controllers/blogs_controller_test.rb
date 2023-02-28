require "test_helper"
class BlogsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should return all the records in the database" do
    get blogs_url
    assert_response :success
  end
end