module EventsHelper
  def event_params
    params.require(:event).permit(:name, :description, :date, :user_id)
  end
end
