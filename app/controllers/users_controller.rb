class UsersController < ApplicationController
  before_action :set_time_zone, if: :user_signed_in?


  def my_dashboard
    @start_date = params.fetch(:start_date, Date.today).to_date
    @sessions = current_user.sessions
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
      @k << key.to_s
      @v << value
    end

    # recuperer les sessions de la semaine en cours
    actual_week = Date.today.cweek

    @actual_sessions = []
    @sessions.each do |session|
      session.programing_at.cweek == actual_week ? @actual_sessions << session : nil
    end
    @hash_session_exo = {
      Mon: 0,
      Tue: 0,
      Wed: 0,
      Thu: 0,
      Fri: 0,
      Sat: 0,
      Sun: 0
    }
    @actual_sessions.each do |session|
      nbr = session.training.workout.exercices.count
      @hash_session_exo[session.programing_at.strftime('%a').to_sym].nil? ? @hash_session_exo[session.programing_at.strftime('%a').to_sym] = nbr : @hash_session_exo[session.programing_at.strftime('%a').to_sym] += nbr
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

  private

  def set_time_zone
    # Time.zone = current_user.time_zone
  end

end
