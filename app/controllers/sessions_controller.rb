class SessionsController < ApplicationController
  def new
    if session[:user] == ENV["JL_UNAME"]
      unless params[:requested_url].blank?
        redirect_to(params[:requested_url])
      end
    end
  end

  def create
    if params[:user] == ENV["JL_UNAME"] && params[:password] == ENV["JL_PWORD"]
      session[:user] = params[:user]
      redirect_to params[:requested_url]
    else
      # render 'new'
      if params[:requested_url].blank?
        redirect_to root_url
      else
        redirect_to root_url(requested_url: params[:requested_url])
      end
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_url
  end
end
