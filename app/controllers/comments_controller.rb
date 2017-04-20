class CommentsController < ApplicationController

  def create
  	@comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/events/#{@comment.event_id}" 
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end
  
  private

	def comment_params
	  params.require(:comment).permit(:comment, :event_id).merge(user: current_user)
	end

end
