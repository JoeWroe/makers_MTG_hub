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
    if @event.valid?
      @event.save!
      flash[:notice] = "Event successully created"
      redirect_to event_path(@event)
    else
      flash[:notice] = "Event information not valid"
      flash[:alert] = @event.errors
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.assign_attributes(attributes)
    if @event.valid?
      flash[:notice] = "Event successully updated"
      @event.save!
      redirect_to event_path(@event)
    else
      flash[:notice] = "Event information not valid"
      flash[:alert] = @event.errors
      redirect_to edit_event_path(@event)
    end
  end

  def destroy
    Event.destroy(params[:id])
    flash[:notice] = "Event successully deleted"
    redirect_to events_path
  end

  private

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
