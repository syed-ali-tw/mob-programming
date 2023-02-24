class BlogsController < ApplicationController
  def index
  end

  def new
  end

  def create
    byebug
    blog = Blog.new(title: params[:title], description: params[:description])
    blog.save
  end
end
