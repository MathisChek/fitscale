class UsersController < ApplicationController

  def index
    raise
  end

  def my_sessions
    raise
  end

  def my_workouts
    @workouts = current_user.workouts
  end

  def my_exercises
    raise
  end
end
