class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def after_sign_in_path_for(resource)
      stored_location_for(resource) ||
        if resource.is_a?(User)
          '/dashboard'
        else
          super
        end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:thumbnail, :name, :surname, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:thumbnail, :name, :surname, :email, :password, :current_password)}
    end

end
