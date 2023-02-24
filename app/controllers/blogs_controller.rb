class BlogsController < ApplicationController
  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(title: params[:title], description: params[:description])
    blog.save
  end
end
