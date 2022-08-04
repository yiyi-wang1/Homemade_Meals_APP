class UsersController < ApplicationController
    before_action :get_user, except: [:new, :create]
    # before_action :authorize_user!, only: [:admin_panel]

    def show
        
    end

    def admin_panel

    end

    private
    def get_user
        @user = User.find_by_id(params[:id])
    end

    def authorize_user!
        redirect_to root_path, alert: "Not authorized" unless params[:id].to_i == current_user.id
    end

end
