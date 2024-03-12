class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @events = @user.events
    @attended_events = @user.attended_events
  end

  def invitations
    @user = current_user
    @accepted_invitations = @user.received_invitations.where('accepted = ?', true).order(created_at: :desc)
    @unread_invitations = @user.received_invitations.where(accepted: nil).order(created_at: :desc)
  end

  def sent_invitations
    @user = current_user
    @accepted_sent_invitations = @user.sent_invitations.where('accepted = ?', true).order(created_at: :desc)
    @unread_sent_invitations = @user.sent_invitations.where(accepted: nil).order(created_at: :desc)
  end
end
