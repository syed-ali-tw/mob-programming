require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest

  test "title should be correct" do
    blog = Blog.all
    get blogs_url
    assert_response :success
    assert_select "h1", "Blogs"
  end

  test "should display correct number of blog" do
    get blogs_url
    assert_select "tbody" do |elements|
      assert_select elements, "td", blog.count
    end
  end

  test "should validate that headers are correct for blog table" do

    get blogs_url
    assert_select "th", { count: 3 }
    assert_select "thead" do
      assert_select "th", "title"
      assert_select "th", "description"
      assert_select "th", "actions"
    end
  end
end