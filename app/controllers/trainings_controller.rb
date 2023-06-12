class TrainingsController < ApplicationController
  def create
    @training = Training.new
    @workout = Workout.find(params[:workout_id])
    @user = current_user
    @training.workout = @workout
    @training.user = @user
    if @training.save
      redirect_to workout_path(@workout)
    else
      render "workouts/show", status: :unprocessable_entity
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to @training.workout, notice: "Training was successfully destroyed.", status: :see_other
  end
end
