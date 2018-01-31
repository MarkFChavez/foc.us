class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    result = Event::Operations::Create.(
      params[:event],
      { current_user: current_user }
    )
    @event = result["model"]

    if result.success?
      redirect_to calendar_path(start_date: @event.start_time.to_date)
    else
      render :new
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    result = Event::Operations::Update.(
      params[:event],
      { id: params[:id], current_user: current_user }
    )
    @event = result["model"]

    if result.success?
      redirect_to calendar_path(start_date: @event.start_time.to_date)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to calendar_path(start_date: @event.start_time.to_date)
  end

end
