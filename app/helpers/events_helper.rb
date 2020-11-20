module EventsHelper
  def event_params
    params.require(:event).permit(:name, :description, :date, :creator_id)
  end
end
