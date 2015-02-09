class EventsController < ApplicationController
    def index
      @events = Event.all
    end

    def show
      @location = Location.find(params[:location_id])
      @event = @location.events.find(params[:id])
    end

    def new
      @location = Location.find(params[:location_id])
      @event = Event.new

    end


    def create
      @event = Event.new(event_params)
      @event.location_id = params[:location_id]
      @location = Location.find(params[:location_id])
      if @event.save
        redirect_to location_path(@location), notice: 'Event successfully created'
      else
        render('new')
      end
    end

    def edit
      @location = Location.find(params[:location_id])
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
      @event.update(event_params)
      @location = Location.find(params[:location_id])
      redirect_to location_event_path(@location, @event), notice: 'Event successfully updated'
    end


    def destroy
      @location = Location.find(params[:location_id])
      @event = @location.events.find(params[:id])
      @event.destroy
      redirect_to location_path(@location), alert: 'Event successfully deleted'
    end


    private
    def event_params
      params.require(:event).permit(:description, :date, :requires_id)
    end


end
