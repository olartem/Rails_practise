class UsersController < ApplicationController
  before_action :set_user, :authenticate_user!, only: %i[ show edit update destroy likes_count ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @best_post = best_post
    @last_action = last_action
    @has_liked_posts = has_liked_posts?
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def best_post()
    max = 0
    
    @user.microposts.each do |micropost|
        micropost.get_upvotes.size
        if max < (micropost.get_upvotes.size) 
            max = micropost.get_upvotes.size
            @best_micropost = micropost
        end
    end 
    @best_micropost
  end

  def has_liked_posts?()
    max = 0
    
    @user.microposts.each do |micropost|
        micropost.get_upvotes.size
        if max < (micropost.get_upvotes.size) 
            max = micropost.get_upvotes.size
            @best_micropost = micropost
        end
    end 
    if (@best_micropost.nil?)    
        false            
    else
        true
    end
  end

  def last_action()
    if !@user.microposts.empty?
        @last_action = [@user.microposts.last.created_at, @user.microposts.last.updated_at].max
    else
        @last_action = @user.created_at
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
