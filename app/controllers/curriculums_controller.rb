class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :edit, :create, :update, :destroy]

  # GET /curriculums
  # GET /curriculums.json
  def index
    @curriculums = Curriculum.all
    @curriculums.each do |curriculum|
      @votes = Vote.where("curriculum_id=#{curriculum.id}")
      @rating = @votes.sum(:value)
      curriculum.update(rating: @rating)
    end
    @curriculums = @curriculums.order(rating: :desc)
  end

  # GET /curriculums/1
  # GET /curriculums/1.json
  def show
    @videos = Video.where(:curriculum_id => Curriculum.find(params[:id]))
    # binding.pry
  end

  # GET /curriculums/new
  def new
    @curriculum = Curriculum.new
    @topics = Topic.all
  end

  # GET /curriculums/1/edit
  def edit
    @videos = Video.where(:curriculum_id => Curriculum.find(params[:id]))
    @video = Video.new
    @curric_id = params[:id]
    # for sidebar
    # @curriculum = Curriculum.where(id = params[:id])
  end 

  # POST /curriculums
  # POST /curriculums.json
  def create
    @curriculum = Curriculum.new(curriculum_params)
    @current_user ||= User.find_by(id: session[:user_id])
    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to edit_curriculum_path(@curriculum), notice: 'Curriculum was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum }
      else
        format.html { render :new }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculums/1
  # PATCH/PUT /curriculums/1.json
  def update
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.json
  def destroy
    @curriculum.destroy
    respond_to do |format|
      format.html { redirect_to curriculums_url, notice: 'Curriculum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_params
      params.require(:curriculum).permit(:title, :description, :level, :user_id, :topic_id)
    end
end
