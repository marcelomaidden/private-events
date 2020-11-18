include EventsHelper

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])

    @attendance = Attendance.new
  end

  def create
    user = User.find(session[:current_userid]['id'])
    @event = user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def enroll
    user = User.find(session[:current_userid]['id'])
    a = Attendance.new(user_id: user.id, event_id: params[:id])
    a.save
    redirect_to events_path
  end
end
