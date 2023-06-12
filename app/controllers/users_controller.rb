class UsersController < ApplicationController

  def my_dashboard
    @user = current_user
    @workouts = Workout.where(user_id: current_user.id)
    @hash = {}
    @workouts.each do |workout|
      workout.muscle_hash.each do |key, value|
        @hash[key].nil? ? @hash[key] = value : @hash[key] += value
      end
    end
    @k = []
    @v = []
    @hash.each do |key, value|
      k << key
      v << value
    end
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
