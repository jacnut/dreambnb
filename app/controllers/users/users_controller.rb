class Users::UsersController < ApplicationController
  before_action :set_user
  before_action :current_user?, only: [:edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :avatar)
    end

    def current_user?
      if current_user != @user
        not_found
      end
    end
end
