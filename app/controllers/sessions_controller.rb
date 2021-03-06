class SessionsController < ApplicationController
  include Authentication
  
  def new
    if session[:user] == ENV["JL_UNAME"]
      unless params[:requested_url].blank?
        redirect_to webhook_event_requests_url
      end
    end
  end

  def create
    if params[:user] == ENV["JL_UNAME"] && params[:password] == ENV["JL_PWORD"]
      session[:user] = params[:user]
      redirect_to webhook_event_requests_url
    else
      redirect_to root_url
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_url
  end
end
