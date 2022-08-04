class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit(:username, :email, :profile_img_url, :password, :password_confirmation)
        if @user.save
            session[:user_id] = @user.id
            flash.notice = 'Signed up!'
            redirect_to welcome_path
        else
            render :new, status: 303
        end
    end
end
