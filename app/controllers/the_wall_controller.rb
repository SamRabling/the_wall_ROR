class TheWallController < ApplicationController
    def new
      @errors = flash[:errors]
    end

    def create
      # @returning_user = User.find_by(user_params)
      # if @returning_user
      #   session[:user_id] = @user.id
      #   redirect_to messages_path
      # else
          @user = User.new(user_params)
          if @user.save
            session[:user_id] = @user.id
            redirect_to messages_path
          else
            flash[:error]= @user.errors.full_messages
            redirect_to the_wall_new_path
          end
    end

    def logout
      reset_session
      redirect_to the_wall_new_path
    end

    private
    def user_params
      params.require(:user).permit(:username)
    end
end
