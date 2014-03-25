require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json
  protect_from_forgery
  
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :admin, :vendor, 
      :percent, :email, :password, :confirm_password) }
  end
end