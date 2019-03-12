class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    modify_exercise_params = exercise_params
    modify_exercise_params[:user_id] = current_user.id
    @exercise = Exercise.find(params[:exercise_id])
    @comment = @exercise.comments.create(modify_exercise_params)
    redirect_to exercise_path(@exercise)
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def exercise_params
    params.require(:comment).permit(:name, :comment)
  end
end
