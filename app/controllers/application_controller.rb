require 'date'
class ApplicationController < ActionController::Base
  def date_now
    date = DateTime.now
    date.localtime.strftime('%m/%d/%Y %H:%M')
  end
  helper_method :current_user_now
  def current_user_now
    User.find(session[:current_user]['id'])
  end
end
