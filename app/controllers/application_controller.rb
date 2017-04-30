class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombres])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:apellidos])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombres])
    devise_parameter_sanitizer.permit(:account_update, keys: [:apellidos])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
