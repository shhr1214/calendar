require 'time'

class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(index show)
  before_action :set_event, only: %i(show edit update destroy)

  def new
    if params[:date].present?
      @event = Event.new(author: current_user,
                         start_time: params[:date].to_datetime,
                         end_time: params[:date].to_datetime)
    else
      @event = Event.new(author: current_user)
    end
  end

  def index
    # TODO: 返り値がないの気持ち悪い。
    event2json
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html {
          redirect_to @event,
          notice: 'event was successfully created.'
        }
        # format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new',
          notice: 'Information is not enough.'
        }
        # format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html {
          redirect_to @event,
          notice: 'event was successfully created!!'
        }
        #format.json {}
      else
        format.html { render 'new' }
        #format.json
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html {
        redirect_to events_url ,
        notice: 'event was successfully deleted!!'
      }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time,
                                  :description, :place, :author_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event2json
    gon.events = Event.all.map do |event|
      {
        "id": event.id,
        "title": event.title,
        "url": "https://hack-scheduler-shhr1214.c9users.io/events/#{event.id}",
        "class": "event-inverse",
        "start": event.start_time.to_date.to_s,
        "end": event.end_time.to_date.to_s,
      }
    end
  end
end