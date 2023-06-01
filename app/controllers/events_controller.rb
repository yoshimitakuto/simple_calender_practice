class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    if Event.create(event_params)
      redirect_to root_path
    else
      redirect_to request.referer
    end
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :content)
  end

end
