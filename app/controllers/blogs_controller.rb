class BlogsController < ApplicationController
  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(title: params[:title], description: params[:description])
    if @blog.save
      flash[:alert]= "Saved the record successfully"
      redirect_to root_path
    end
  end
end
