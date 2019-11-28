class PostsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @current_user = current_user
  end
end
