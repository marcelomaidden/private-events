require 'date'
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
    signin(@user.id)
    @date = date_now

    @events = Event.all
  end

  def sign_in
    @users = User.all
  end

  def sign_out
    reset_session
    redirect_to sign_in_path
  end

  private

  def signin(id)
    session[:current_userid] = User.find(id)
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
