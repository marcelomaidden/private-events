module UsersHelper
  def current_user(id)
    session[:current_user] = User.find(id)
    session[:current_user]
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
