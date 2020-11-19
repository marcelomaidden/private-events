module ApplicationHelper
  def current_user?
    session[:current_user] = User.find(params[:id])
    session[:current_user]
  end
end
