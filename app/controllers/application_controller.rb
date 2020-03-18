class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :require_login

  include SessionsHelper

  def require_login
    return if logged_in?
    redirect_to login_path
  end
  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
