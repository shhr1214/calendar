class ParticipantsController < ApplicationController
  before_action :set_event
  def create
    @event.participants.create!(user: current_user, participation: params[:commit])
    redirect_to event_path(@event), notice: "参加表明しました"
  end

  def update
    participant = @event.participants.find_by(user: current_user)
    participant.update!(participation: params[:commit])
    redirect_to event_path(@event), notice: "ステータスを更新しました"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end