#coding: UTF-8
class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = I18n.t('messages.success_login', :name => user.first_name)
    redirect_to root_url
  end

  def destroy
    
  end
end