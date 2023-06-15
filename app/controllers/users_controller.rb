class UsersController < ApplicationController
  before_action :set_time_zone, if: :user_signed_in?

  def my_dashboard
    @available_workouts = (current_user.trainings + Workout.where(user_id: current_user.id)).uniq
    @start_date = params.fetch(:start_date, Date.today).to_date
    @sessions = current_user.sessions
    @workouts = Training.where(user_id: current_user.id).map(&:workout)
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
    @actual_sessions = current_user.week_sessions

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

      @hash_session_exo[session.programing_at.strftime('%a').to_sym] += nbr
    end
    @days = []
    @count_exo_day = []
    @hash_session_exo.each do |key, value|
      @days << key.to_s
      @count_exo_day << value
    end

    la = (0..6).map do |nbr|
      array = current_user.week_sessions.find_all { |d| d.programing_at.wday == nbr }.map(&:training).map(&:workout).map(&:score)
      avg = (array.sum / array.size.to_f).round(1)
    end.map { |e| e.nan? ? 0 : e }
    la = la << la.delete_at(0)
    @res = la
    # la.each do |ele|
    #   @res << (ele * 10)
    # end
    # @zeb = current_user.week_sessions.map { |e| "#{e.programing_at.strftime('%a')} / #{e.programing_at.wday}" }
  end

  def my_sessions
    raise
  end

  def my_workouts
    @workouts = current_user.workouts
    @trainings = current_user.trainings
  end

  def my_exercises
    raise
  end

  private

  def set_time_zone
    # Time.zone = current_user.time_zone
  end
end
