#coding: UTF-8
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user
      flash[:success] = I18n.t "devise.omniauth_callbacks.login", :kind => "Facebook"
    else
      data = request.env["omniauth.auth"]
      user = User.apply_omniauth(data)
      if user.save
        flash[:success] = I18n.t "devise.omniauth_callbacks.create"
      else
        flash[:error] = I18n.t "devise.omniauth_callbacks.errors"
      end
      user.reload
    end
    sign_in_and_redirect @user
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  end
end
