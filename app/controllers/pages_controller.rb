class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    render :home, layout: "homepage"
  end

  def actuality
    # muscle = Exercice::MUSCLES.sample
    # Model.order("RANDOM()").limit(1)
    @workouts = Workout.order("RANDOM()").limit(5)
  end
end
