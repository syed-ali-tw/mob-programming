require "test_helper"
class BlogsControllerTest < ActionDispatch::IntegrationTest
  extend Minitest::Spec::DSL

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
      assert_select "th", "title"
      assert_select "th", "description"
      assert_select "th", "actions"
    end
  end

  test "should have a link that allows you to edit blog" do
    get blogs_url
    assert_select "a", "Edit Blog"
    puts assert_select "a"
    puts edit_path_url(blog[0])
    assert_select("a[href=?]", edit_path_url(blog[0]))
  end


  context "Given im a blogger" do
    context "when I visit the new blog page" do
      test"Then I get presented with a fillable form" do

      end
    end
  end
end