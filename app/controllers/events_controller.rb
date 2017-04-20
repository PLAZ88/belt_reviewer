class EventsController < ApplicationController

  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
  	@user = User.find(current_user.id)
  	@close_events = Event.where(state: @user.state)
  	@far_events = Event.where.not(state: @user.state)
  end

  def show
  	@event = Event.find(params[:id])
    @goers = @event.users
    @comments = @event.comments
  end

  def create
  	@event = Event.new(event_params)
    if @event.save
      redirect_to "/events"
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
  	@event = Event.find(params[:id])
    @event.destroy if @event.user === current_user
    redirect_to "/events"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to "/events/#{@event.id}"
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to :back
    end
  end

  private

	def event_params
	  params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)
	end

  def require_correct_user
    @event = Event.find(params[:id])
    redirect_to '/events' if session[:user_id] != @event.user.id
  end

end
