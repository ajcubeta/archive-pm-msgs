class ApplicationController < ActionController::Base # :nodoc:
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    session[:user] == "jobline"
  end

  def authenticate_user!
    unless current_user
      # session[:requested_url] = request.url
      session[:user] = nil
      redirect_to root_url(requested_url: request.url)
    end
  end
end
