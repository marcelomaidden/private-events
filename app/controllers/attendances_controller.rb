# rubocop:disable Layout/LineLength

class AttendancesController < ApplicationController
  def create
    if User.find(params[:user][:user_id]).attendances.where(event_id: params[:event_id]).none?
      user = User.find(params[:user][:user_id])
      a = Attendance.new(event_id: params[:event_id], user_id: user.id)
      a.save
      p params[:user][:user_id]
      p session[:current_user]['id']
      if (params[:user][:user_id]).to_i == session[:current_user]['id']
        msg = "You decided to attend #{Event.find(params[:event_id]).name}"
      else
        msg = "You decided to invite #{User.find(params[:user][:user_id]).username} to attend #{Event.find(params[:event_id]).name}"
      end
    else
      msg = "You are already attending to #{Event.find(params[:event_id]).name}"
    end
    redirect_to event_path(params[:event_id]), notice: msg
  end
end

# rubocop:enable Layout/LineLength
