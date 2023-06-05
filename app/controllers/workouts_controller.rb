class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(user_id: current_user.id)
    @training = Training.create(workout_id: @workout.id)
  end

  # def edit
  #   @workout = Workout.find(params[:id])
  # end

  # def update
  #   @workout = Workout.find(params[:id])
  #   @workout.update
  # end
end
