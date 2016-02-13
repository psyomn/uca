class AdministrationController < ApplicationController
  before_filter :check_admin

  def index
  end

  private

  def check_admin
    return if current_user.has_role?(:admin)
    raise CanCan::AccessDenied
  end
end
