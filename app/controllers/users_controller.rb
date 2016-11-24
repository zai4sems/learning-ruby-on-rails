class UsersController < ApplicationController
    before_filter :authorize_admin, only: [:index, :edit, :update, :user_params]
    def index
        if params[:approved] == "false"
          @users = User.where(approved: false)
        else
          @users = User.all
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update_attributes(user_params)
        redirect_to users_path
    end
    
    def user_params
       params.require(:user).permit(:id,:approved) 
    end
end