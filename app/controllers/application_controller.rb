class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:family_name, :first_name, :gender, :age, :organization, :job, :avatar, :account_id)
    devise_parameter_sanitizer.for(:account_update).push(:family_name, :first_name, :gender, :age, :organization, :job, :avatar)
  end
end
