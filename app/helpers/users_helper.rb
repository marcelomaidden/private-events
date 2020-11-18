module UsersHelper
  def signin(id)
    session[:current_userid] = User.find(id)
    session[:current_userid]
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
