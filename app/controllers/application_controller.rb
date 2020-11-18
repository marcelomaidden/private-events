class ApplicationController < ActionController::Base
  def session_signed
    session[:current_userid] = @user
  end
end
