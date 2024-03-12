class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:invitation][:sender_id] = current_user.id
      @event = Event.find(params[:event_id])  
      @invitation = @event.invitations.build(invitation_params)

      # Try to find the recipient by email
      recipient = User.find_by(email: params[:invitation][:recipient_email])

      if @invitation.save
        redirect_to @event, notice: 'Invitation was successfully sent.'
      else
        flash[:error] = @invitation.errors.full_messages.join(", ")
        redirect_to @event
      end
    else
      redirect_to @event
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    if @invitation.sender == current_user
      @invitation.destroy
    end
    redirect_to root_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:recipient_email, :sender_id, :event_id)
  end
end

