class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params.permit(:id)[:id])
    @bands = @user.bands
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "No such user"
    redirect_to root_path
  end

  def edit_info
    @user = User.find(params.permit(:id)[:id])
  end

  def update_info
    @user = User.find(params.permit(:id)[:id])
    if @user.update(user_params)
      flash[:notice] = 'Update successful'
      redirect_to user_path(@user)
    else
      redirect_to edit_user_info_path
    end
  end

  private
    def user_params
      params.require(:user)
        .permit(:name, :email, :password,
           :password_confirmation,
           :nickname, :real_name, :bio)
    end
end
