class AttendancesController < ApplicationController
  def create
    puts params[:event_id]
    unless User.find(params[:user][:user_id]).attendances.where(event_id: params[:event_id]).any?
      user = User.find(params[:user][:user_id])
      a = Attendance.new(event_id: params[:event_id], user_id: user.id)
      puts a.event_id, a.user_id
      a.save
    end
    redirect_to events_path
  end
end
