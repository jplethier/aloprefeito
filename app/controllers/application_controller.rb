class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_to_domain
  before_filter :authenticate_user!

  def logout
    sign_out
    flash[:success] = I18n.t('messages.logout')
    redirect_to root_path
  end

  def redirect_to_domain
    redirect_to 'http://www.aloprefeito.com' if request.url.match('webbynode')
  end
end
