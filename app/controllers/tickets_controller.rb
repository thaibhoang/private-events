class TicketsController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:ticket][:attendee_id] = current_user.id
      @event = Event.find(params[:event_id])  
      @ticket = @event.tickets.build(ticket_params)
      if @ticket.save
        redirect_to @event, notice: 'Ticket was successfully created.'
      else
        flash[:error] = @ticket.errors.full_messages.join(", ")
        redirect_to @event
      end
    else
      redirect_to @event
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.attendee == current_user
      @ticket.destroy
    end
    redirect_to root_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:event_id, :attendee_id, :name, :email)
  end
end
