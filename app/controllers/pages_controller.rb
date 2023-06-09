class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    render :home, layout: "homepage"
  end

  def actuality
    @workouts_beg = Workout.all.sort_by(&:score)[0..5]
    @workouts_exp = Workout.all.sort_by(&:score)[0..5].reverse
  end
end
