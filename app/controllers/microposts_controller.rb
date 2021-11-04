class MicropostsController < ApplicationController
    before_action :set_micropost, only: %i[like destroy update edit]
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

    def edit
    end

    def update
        respond_to do |format|
          if @micropost.update(micropost_params)
            format.html { redirect_to @user, notice: "Micropost was successfully updated." }
            format.json { render :show, status: :ok, location: @micropost }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @micropost.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @micropost.destroy
        respond_to do |format|
          format.js 
          format.html { redirect_to @user, notice: "Micropost was successfully destroyed." }
          format.json { head :no_content }
        end
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
        @user = User.find(params[:user_id])
        @micropost = Micropost.find(params[:id])
    end
end
