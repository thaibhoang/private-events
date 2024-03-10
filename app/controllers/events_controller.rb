class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_event, except: [:index, :new, :create]
  def index
    @events = Event.all.includes(:creator)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user  
    @event = @user.events.build(params_event)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def params_event 
    params.require(:event).permit(:title, :description, :date, :location)
  end

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
