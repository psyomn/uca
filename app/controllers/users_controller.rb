class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params.permit(:id)['id'])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "No such user"
  end

  private

  def user_params
    params.require(:user).permit(:id, :bio, :email)
  end
end
