class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #ParameterSanitizer deals with permitting specific parameters values for
  # each Devise scope in app. the sanitizer know about Devise default params
  # and this cord can extend the permitted params.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :subscription_id])
  end

  private

  def admin_only
    unless current_user && current_user.admin?
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end

end
