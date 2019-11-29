class PostsController < ApplicationController
  before_action :signed_in?, only: [:new, :create]

  def new
  end

  def create


    flash[:success] = 'Post created succesfully!'
    redirect_to root_url
  end

  def index
    @current_user ||= current_user
  end
end
