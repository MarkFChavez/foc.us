class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to calendar_path(start_date: @event.start_time.to_date)
    else
      render :new
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time)
    end

end
