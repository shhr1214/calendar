class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'event was successfully created!!' }
        #format.json {}
      else
        #format.html
        #format.json
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url , notice: 'event was successfully deleted!!' }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :description, :place, :author_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end