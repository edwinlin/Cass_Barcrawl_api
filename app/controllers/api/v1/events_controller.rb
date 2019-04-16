class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
    render json: @events
  end

  def create
    # byebug
    @event = Event.create(event_params)
    render json: @event
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  # Private helper methods
  private

  def event_params
    params.require(:event).permit(:name, :user_id)
  end

end
