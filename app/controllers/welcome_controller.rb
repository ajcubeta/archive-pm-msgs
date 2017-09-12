class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "jobline", password: "resources"

  def index
    @title = "Welcome"
  end
end
