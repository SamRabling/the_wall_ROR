class TheWallController < ApplicationController
    def new
      @errors = flash[:errors]
    end

    def create
      @returning_user = User.find_by(user_params)
      if @returning_user
        session[:username] = @user.username
        redirect_to messages_path
      else
          @user = User.new(user_params)
          if @user.save
            session[:id] = @user.id
            redirect_to messages_path
          else
            flash[:error]= @user.errors.full_messages
            redirect_to the_wall_new_path
          end
      end
    end

    def messages
      @user = User.find(session[:id])
      @messages = Message.includes(:comments).all
    end

    def new_messages
    end

    def comments
    end

    def new_comments
    end

    def logout
      reset_session
      redirect_to users_new_path
    end

    private
    def user_params
      params.require(:user).permit(:username)
    end

    def message_params
      params.require(:message).permit(:message)
    end
end
