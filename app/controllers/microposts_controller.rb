class MicropostsController < ApplicationController
    before_action :set_micropost, only: %i[like]
    before_action :authenticate_user!, only: [ :like ]
    
    def index 
        @microposts = Micropost.all
        @users = User.all
    end

    def create
        @user = current_user
        @micropost = @user.microposts.create(micropost_params)
        redirect_to user_path(@user)
    end

    def new
        @user=current_user
    end

    def like
        if current_user.voted_for? @micropost
            @micropost.unliked_by current_user
        else
            @micropost.liked_by current_user
        end
    end
    
    private
    def micropost_params
       params.require(:micropost).permit(:title, :body)
    end

    def set_micropost
        @user=User.find(params[:id])
        @micropost = @user.microposts.find(params[:user_id])
    end
end
