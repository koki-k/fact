class InvitationshipsController < ApplicationController

  before_action :set_event, only: [:invitable, :create]
  before_action :are_you_owner?, only: [:invitable, :create]

  def invitable
    @invitable_users = @event.owner.followers
  end

  def invited
    @user = User.find(params[:user_id])
    @invitationships = @user.passive_invitationships
  end

  def create
    current_user.active_invitationships.create(invited_id: params[:invited_id], event_id: params[:event_id])
    redirect_to action: :invitable
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def are_you_owner?
    unless current_user == @event.owner
      redirect_to event_path(@event)
    end
  end
end
