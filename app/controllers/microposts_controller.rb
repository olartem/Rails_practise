class MicropostsController < ApplicationController
    def create
        @user = current_user
        @micropost = @user.microposts.create(micropost_params)
        redirect_to user_path(@user)
    end

    def new
        @user=current_user
    end
    
    private
    def micropost_params
       params.require(:micropost).permit(:title, :body)
    end
end
