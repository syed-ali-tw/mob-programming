require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest

  test "title should be correct" do
    blog = Blog.all
    get blogs_url
    assert_response :success
    assert_select "h1", "Blogs"
  end

  test "should display correct number of blog" do
    blog = Blog.all
    Blog.create(title: 'test 4839', description: "another blog")
    get blogs_url
    assert_select "tbody" do |elements|
      assert_select elements, "td", blog.count
    end
  end
end