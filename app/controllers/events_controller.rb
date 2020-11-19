class EventsController < ApplicationController
  include EventsHelper
  include UsersHelper

  def index
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def show
    if session[:current_user]
      @event = Event.find(params[:id])
      @date = date_now
      @attendance = Attendance.new
      @users_not_in = User.all.where.not(id: @event.attendee).where.not(id: session[:current_user]['id'])
    else
      redirect_to sign_in_path
    end
  end

  def create
    user = User.find(session[:current_user]['id'])
    @event = user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def new
    if session[:current_user]
      @event = Event.new
    else
      redirect_to sign_in_path
    end
  end

  def enroll
    user = User.find(session[:current_user]['id'])
    a = Attendance.new(user_id: user.id, event_id: params[:id])
    a.save
    redirect_to events_path
  end
end
