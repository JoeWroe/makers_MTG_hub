class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(attributes)
    @event.valid? ? successful(@event) : unsuccesful(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.assign_attributes(attributes)
    @event.valid? ? successful(@event, true) : unsuccesful(@event, true)
  end

  def destroy
    Event.destroy(params[:id])
    flash[:notice] = "Event successfully deleted"
    redirect_to events_path
  end

  private

  def unsuccesful(event, edit = false)
    flash[:notice] = "Event information not valid"
    flash[:alert] = event.errors
    redirect_to edit ? edit_event_path : new_event_path
  end


  def successful(event, edit = false)
    event.save!
    flash[:notice] = "Event successfully #{ edit ? "updated" : "created" }"
    redirect_to event_path(event)
  end

  def attributes
    params.require(:event).permit(*Event::REQUIRED).merge(start_time: start_time)
  end

  def start_time
    args = %w(1 2 3 4 5).map { |num| "start_time(#{num}i)" }
    dt_params = params.require(:event).permit(*args)
    dt_args = dt_params.values.map { |v| v.to_i }
    DateTime.civil(*dt_args)
  end
end
