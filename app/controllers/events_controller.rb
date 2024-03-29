class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_event, except: [:index, :new, :create]

  def index
    if current_user
      @events = Event.where(private: false)
        .or(current_user.events.where(private: true)).includes(:creator).limit(20).order(created_at: :desc)
      @invited_private_events = current_user.invited_events.distinct.limit(20).order(created_at: :desc)
      else
      @events = Event.where(private: false).includes(:creator).limit(20).order(created_at: :desc)
    end
  end

  def show
    @attendees_name = @event.tickets.pluck(:name)
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user  
    @event = @user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @event.creator == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @event.creator == current_user
      if @event.update(event_params)
        redirect_to @event
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if @event.creator == current_user
      @event.destroy
    end
    redirect_to root_path
  end

  private

  def event_params 
    params.require(:event).permit(:title, :description, :date, :location, :private)
  end

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

end
