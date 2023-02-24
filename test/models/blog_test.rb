require "test_helper"

class BlogTest < ActiveSupport::TestCase
  test "shouldn't save if there is no title and description" do
    blog = Blog.new

    assert_not blog.save
  end

  test "shouldn't save if there is no title" do
    blog = Blog.new(description: "some desc")

    assert_not blog.save
  end

  test "shouldn't save if there is no description" do
    blog = Blog.new
    blog.title = 'some title'

    assert_not blog.save
  end

  test "should save if fields provided" do
    blog = Blog.new
    blog.title = "test title"
    blog.description = "description"

    assert blog.save
  end
end
