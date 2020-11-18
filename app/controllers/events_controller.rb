class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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

  private 

  def event_params
    params.require(:event).permit(:name, :description, :user_id)
  end
end
