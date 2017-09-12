class UsersController < ApplicationController
  http_basic_authenticate_with name: "jobline", password: "resources", except: :index
  
  def index
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
