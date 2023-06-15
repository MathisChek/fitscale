class ExercicesController < ApplicationController
  before_action :set_exercice, only: %i[create show flexibility]
  def new
    @exercice = Exercice.new
  end

  def create
    @exercice.user = current_user
    if @exercice.save
      redirect_to exercices_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @exercices = Exercice.all
  end

  def show
    @rating = Rating.find_by(user: current_user, exercice: @exercice)
    @rating = @rating.nil? ? Rating.new : @rating
    #@rating = Rating.where(user_id: current_user.id, exercice_id: @exercice.id).empty? ? Rating.new : Rating.where(user_id: current_user.id, exercice_id: @exercice.id).first
    @ratings = @exercice.ratings
    @rating_user = Rating.where(user_id: current_user.id, exercice_id: @exercice.id).first
  end


  private

  def set_exercice
    @exercice = Exercice.find(params[:id])
  end
end
