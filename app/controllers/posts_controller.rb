class PostsController < ApplicationController
  http_basic_authenticate_with name: "jobline", password: "resources", except: :index

  def index
    @posts = Post.all
  end

  def webhoook
    @title = "Webhook"
  end
end
