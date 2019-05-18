class BlogtopController < ApplicationController

  before_action :move_to_index, except: [:index, :show]


  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    # binding.pry

  end

  def new
  end


  def create
    Blog.create(text: blog_params[:text], user_id: current_user.id)
  end

  def edit
    @blog = Blog.find(blog_params[:id])
  end

  def destroy
    #binding.pry

    blog = Blog.find(blog_params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params) if blog.user_id == current_user.id
  end

  def show
  end
end

private
def blog_params
  params.permit(:id,:text)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end