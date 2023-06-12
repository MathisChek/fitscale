class UsersController < ApplicationController
  before_action :set_time_zone, if: :user_signed_in?


  def my_dashboard
    @user = current_user
    @start_date = params.fetch(:start_date, Date.today).to_date
    @sessions = @user.sessions
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

  def set_time_zone
    # Time.zone = current_user.time_zone
  end

end
