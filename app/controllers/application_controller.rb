require 'date'
class ApplicationController < ActionController::Base
  def date_now
    date = DateTime.now
    date.strftime('%Y/%m/%d %H:%M')
  end
end
