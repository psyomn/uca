class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    Offense.create(
      user_id: current_user.id,
      offense_type: Offense::AuthOnResource,
      attempted_resource: "#{exception.action} #{exception.subject}",
      message: exception.message)

    redirect_to main_app.root_url, :alert => exception.message
  end
end
