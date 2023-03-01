require "test_helper"
class BlogsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should return all the records from the database" do
    blog = Blog.all
    get blogs_url
    assert_response :success
    assert_select "h1", "#{blog.count}"
  end
end