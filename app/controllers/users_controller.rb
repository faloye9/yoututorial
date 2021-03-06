class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @curriculums = Curriculum.where(user_id: params[:id])
    @allcurriculums = Curriculum.all
    @user_id = User.where(id: params[:id])
     @current_user ||= User.find_by(id: session[:user_id])
     @subscriptions = Subscription.all
     @videos = Video.all

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json (need to double check if this is implemented for JSON - MR)
  def create
    @user = User.new(user_params)
    if @user.save
      # prevent login prompt
      log_in @user
      flash[:success] = "Welcome to your video tutorial dashboard!"
      # redirect_to user profile, (user_url(@user)), which rails infers from @user here
      redirect_to @user
    else
      # flash[:danger] = "Errors! Try again"
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :image)
    end

end
