#coding: UTF-8
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    binding.pry
    if @user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.login", :kind => "Facebook"
      sign_in_and_redirect @user
    else
      data = request.env["omniauth.auth"]
      user = User.apply_omniauth(data)
      if user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.create"
      else
        flash[:alert] = I18n.t "devise.omniauth_callbacks.errors"
      end
      redirect_to root_path
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  end
end