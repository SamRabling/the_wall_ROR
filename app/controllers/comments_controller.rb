class CommentsController < ApplicationController
  def new_comments
    @comment = Comment.new(comment_params)
    @comment.message = Message.find(params[:id])
    @comment.user = User.find(session[:user_id])
    if @comment.save
      puts "*******  comment was valid   *********"
      redirect_to messages_path
    else
      flash[:error]= comment.errors.full_messages
      puts "######### comment was not valid #########"
      redirect_to messages_path
    end 
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
