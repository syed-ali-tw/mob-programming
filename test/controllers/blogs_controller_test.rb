require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest

  blog = Blog.all
  test "title should be correct" do
    get blogs_url
    assert_response :success
    assert_select "h1", "Blogs"
  end

  test "should display correct number of blog" do
    get blogs_url
    assert_select "tbody" do |elements|
      assert_select elements, "tr", blog.count
    end
  end

  test "should validate that headers are correct for blog table" do
    get blogs_url
    assert_select "th", { count: 3 }
    assert_select "thead" do
       assert_select "th", "Title"
       assert_select "th", "Description"
       assert_select "th", "Action"
    end
  end

  test "should have a link that allows you to edit blog" do
    get blogs_url
    assert_select "a", "Edit Blog"
    assert_select("a[href=?]", edit_path_url(blog[0]))
  end

  describe "Given im a blogger" do
    describe "when I visit the new blog page" do
      it "should display a fillable form" do

      end
    end
  end
end