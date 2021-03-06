class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  rescue_from CanCan::AccessDenied do
  	redirect_to root_path, notice:"The page u are looking for doesnt exist" 
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:mobile])
  end	 
end