# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :signed_in?, only: %i[new create]

  def new; end

  def create
    if current_user.nil?
      flash[:danger] = 'You need to be signed in to create post'
      redirect_to root_url
    else
      @post = current_user.posts.new(post_params)
      if @post.save
        flash[:success] = 'Post created succesfully!'
        redirect_to root_url
      else
        flash[:danger] = 'Invalid inputs'
        render 'new'
      end
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
