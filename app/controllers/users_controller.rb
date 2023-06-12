class UsersController < ApplicationController

  def my_dashboard
    week()
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

  private

  def week
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @start_date = @date.beginning_of_week
    @end_date = @date.end_of_week
  end

end
