class ParticipantsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    current_user.participants.create(event_id: params[:event_id])
    redirect_to event_path(params[:event_id])
  end

  def destroy
    @paricipant = Participant.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end
end
