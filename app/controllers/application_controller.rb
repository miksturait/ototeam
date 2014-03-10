class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :locale
    devise_parameter_sanitizer.for(:account_update) << { own_profile_attributes: [:id, :fullname, :phone] }
  end
end
