class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      signin(@user.id)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def signin(id)
    session[:current_userid] = User.find(id)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
