class AuthenticatedUser < ApplicationController
  before_filter :authenticate_user!
  before_action :set_locale

  protected

  def set_locale
    I18n.locale = current_user.locale.presence || I18n.default_locale
  end
end
