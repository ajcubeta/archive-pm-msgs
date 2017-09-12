class PostsController < ApplicationController
  http_basic_authenticate_with name: "jobline", password: "resources", except: :index

  def webhoook
    @title = "Webhook"
  end
end
