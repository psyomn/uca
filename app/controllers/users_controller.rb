class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params.permit(:id))
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "No such user"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user)
        .permit(:name, :email, :password,
           :password_confirmation, :role,
           :nickname, :real_name, :id)
    end
end
