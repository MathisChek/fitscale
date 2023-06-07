class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[edit update]

  def index
    raise
  end

  def show
    raise
  end

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
    # à modifier avec wo set
  end

  def update
    @workout.update(workout_params)
    redirect_to edit_workout_path(@workout)
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :description)
  end
end
