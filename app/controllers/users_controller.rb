class UsersController < ApplicationController

  def my_dashboard
    @user = current_user
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
