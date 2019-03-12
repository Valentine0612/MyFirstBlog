class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:change_rating]
  # TODO: add faded alerts

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  def saves

  end

  def change_rating
    exer = Exercise.find_by(id: params[:exercise_id])
    unless record = VoteTable.find_by(user_id:current_user.id, exercise_id: params[:exercise_id])
      record = VoteTable.create({user_id:current_user.id, exercise_id: params[:exercise_id]})
    end
    if record.vote < 1 and params[:change] == 'up'
      exer.rating += 1
      record.vote += 1
    elsif record.vote > -1 and params[:change] == 'down'
      exer.rating -= 1
      record.vote -= 1
    end
    exer.save
    record.save
    respond_to do |format|
      format.json { render json: { rating: exer.rating, vote: record.vote } }
    end
  end

  def feed
  end

  # POST /exercises
  # POST /exercises.json
  def create
    modify_exercise_params = exercise_params
    modify_exercise_params[:user_id] = current_user.id
    @exercise = Exercise.new(modify_exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:title, :description)
    end
end
