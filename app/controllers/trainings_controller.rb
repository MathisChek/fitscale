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
    @training.destroy
    respond_to do |format|
      format.html { redirect_to "workouts/show", notice: "Training was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
