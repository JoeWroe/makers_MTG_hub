class ParticipantsController < ApplicationController
  def new
    event = Event.find(params[:event_id])
    user = User.find(current_user)
    event.users << user
    if event.valid?
      flash[:notice] = "You are now participating in this event"
      event.save
    else
      flash[:notice] = "You are unable to be added to this event"
    end
    redirect_to event_path(event)
  end
end
