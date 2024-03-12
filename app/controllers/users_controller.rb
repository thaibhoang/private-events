class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @events = @user.events.limit(20).order(created_at: :desc)
    @attended_events = @user.attended_events.limit(20).order(created_at: :desc)
  end

  def invitations
    @user = current_user
    @accepted_invitations = @user.received_invitations.where('accepted = ?', true).limit(20).order(created_at: :desc)
    @unread_invitations = @user.received_invitations.where(accepted: nil).limit(20).order(created_at: :desc)
  end

  def sent_invitations
    @user = current_user
    @accepted_sent_invitations = @user.sent_invitations.where('accepted = ?', true).limit(20).order(created_at: :desc)
    @unread_sent_invitations = @user.sent_invitations.where(accepted: nil).limit(20).order(created_at: :desc)
  end
end
