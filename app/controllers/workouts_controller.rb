class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    if @workout.save
      redirect_to edit_workout_path(@workout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update(workout_params)
    redirect_to edit_workout_path(@workout)
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :description)
  end
end
