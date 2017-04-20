class AttendeesController < ApplicationController

  def create
    Attendee.create(attendee_params)
    redirect_to "/events"
  end

  def destroy
    @attendee = Attendee.where(event_id: params[:id], user_id: session[:user_id])
    @attendee.first.destroy if session[:user_id] === @attendee[0].user_id
    redirect_to "/events"
  end
  
  private
    def attendee_params
      params.require(:attendee).permit(:event_id).merge(user: current_user)
    end

end
