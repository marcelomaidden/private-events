require 'date'
class ApplicationController < ActionController::Base
  def date_now
    date = DateTime.now
    date.localtime.strftime('%m/%d/%Y %H:%M')
  end
end
