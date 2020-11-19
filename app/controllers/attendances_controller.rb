class AttendancesController < ApplicationController
  def create
    unless User.find(session[:current_userid]['id']).attendances.where(event_id: params[:event_id]).any?
      user = User.find(session[:current_userid]['id'])
      a = Attendance.new(event_id: params[:event_id], user_id: user.id)
      a.save
    end

    redirect_to events_path
  end
end
