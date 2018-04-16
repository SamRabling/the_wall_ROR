class MessagesController < ApplicationController
  def messages
      @user = User.find(session[:id])
      @messages = Message.includes(:comments)all
      @errors = flash[:errors]
    end

    def new_messages
      @message = Message.new(message_params)
      @message.user = User.find(session[:id])
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
    def message_params
      params.require(:message).permit(:message)
    end
end
