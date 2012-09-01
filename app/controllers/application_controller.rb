class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    session[:user_id]
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to root_path
    end
  end

  helper_method :current_user, :user_signed_in?

end
