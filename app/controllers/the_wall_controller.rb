class TheWallController < ApplicationController
    def new
    end

    def create
      # returning_user = User.find_by(user_params)
      # if returning_user
      #   session[:user_id] = @user.id
      #   redirect_to messages_path
      # else
          @user = User.new(user_params)
          if @user.save
            session[:user_id] = @user.id
            redirect_to messages_path
          else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
          end
    end

    def show_messages
    end

    def new_messages
    end

    def show_comments
    end

    def new_comments
    end

    def logout
    end

    private
    def user_params
      params.require(:user).permit(:username)
    end
end
