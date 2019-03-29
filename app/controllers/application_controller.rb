class ApplicationController < ActionController::Base
    protect_from_forgery
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        exception.default_message = "No estás autorizado para acceder a esta página."
        # flash[:error] = exception.message
        redirect_to root_url, :alert => exception.message
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :name, :lastname, :ci, :phone, :career, :role, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :name, :lastname, :ci, :phone, :career, :email, :role)}
    end
end
