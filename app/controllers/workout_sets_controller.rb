class WorkoutSetsController < ApplicationController
  def create
    @workout_set = WorkoutSet.new(workout_set_params)
    @workout = Workout.find(params[:workout_id])
    @workout_set.workout = @workout
    if @workout_set.save
      redirect_to edit_workout_path(@workout)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def workout_set_params
    params.require(:workout_set).permit(:repetition, :workout_id, :exercice_id)
  end
end
