class UsersController < ApplicationController
  def show
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @user = current_user
      @events = @user.events
    end
  end
end
