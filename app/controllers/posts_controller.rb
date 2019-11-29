class PostsController < ApplicationController
  before_action :signed_in?, only: [:new, :create]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post created succesfully!'
      redirect_to root_url

    else
      flash[:danger] = 'Invalid inputs'
      render 'new'
    end
  end

  def index
    @posts = Post.all
    @current_user ||= current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
