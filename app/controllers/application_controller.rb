class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  def logout
    sign_out
    redirect_to root_path, :notice => I18n.t('messages.logout')
  end
end
