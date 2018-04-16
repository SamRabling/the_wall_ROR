class CommentsController < ApplicationController
  def new
    @comment = Message.new(message_params)
    @comment.user = User.find(session[:id])
    if @message.save
      puts "*******  message was valid   *********"
      redirect_to messages_path
    else
      flash[:error]= @message.errors.full_messages
      puts "######### message was not valid #########"
      redirect_to messages_path
    end 
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
