class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".success"
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = t ".danger"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]

    return if @user

    flash.now[:danger] = t ".danger"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end
end
