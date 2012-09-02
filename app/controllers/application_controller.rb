class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  def logout
    sign_out
    flash[:success] = I18n.t('messages.logout')
    redirect_to root_path
  end
end
