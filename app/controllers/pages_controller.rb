class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    render :home, layout: "homepage"
  end

  def actuality

  end
end
