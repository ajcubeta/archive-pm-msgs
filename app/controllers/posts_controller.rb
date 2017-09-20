class PostsController < ApplicationController
  include Authentication

  def index
    @posts = Post.all
  end

  def webhoook
    @title = "Webhook"
  end
end
