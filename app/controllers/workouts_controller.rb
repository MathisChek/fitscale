class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[edit update show destroy]

  def index
    @workouts = Workout.all

    if params[:query].present?
      @workouts = Workout.where("name ILIKE ?", "%#{params[:query]}%")
    end



    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "components/list_workouts", locals: {workouts: @workouts}, formats: [:html] }
    end
  end

  def show
    @training = Training.new
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    if @workout.save
      training = Training.new()
      training.workout = @workout
      training.user = current_user
      training.save
      redirect_to edit_workout_path(@workout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # à modifier avec wo set
    @exercices = Exercice.search(params.dig(:filter, :query))
    @workout_set = WorkoutSet.new
  end

  def update
    @workout.update(workout_params)
    redirect_to edit_workout_path(@workout)
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, status: :see_other
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :description)
  end
end
