class EventsController < ApplicationController
  def index
    events = Event.all
    @pending_events = []
    @past_events = []
    events.each do |event|
      if event.start_time >= Time.now
        @pending_events << event
      else
        @past_events << event
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Your event was created successfully."
      redirect_to @event
    else
      flash[:alert] = "There was a problem saving your event."
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update_attributes event_params
      flash[:notice] = "Your event was updated successfully."
      redirect_to event
    else
      flash[:alert] = "There was a problem updating your event."
      redirect_to(:back)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "The event was deleted successfully."
      redirect_to events_path
    else
      flash[:alert] = "There was a problem deleting the event."
      redirect_to @event
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :start_time)
  end
end
