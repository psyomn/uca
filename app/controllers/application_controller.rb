class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    Offense.create(
      user_id: current_user.try(:id),
      offense_type: Offense::AuthOnResource,
      attempted_resource: "#{exception.action} #{exception.subject}",
      message: exception.message)

    redirect_to main_app.root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
  end
end
