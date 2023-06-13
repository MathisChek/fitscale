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
    raise
  end

  def show
      @rating = Rating.new
      @ratings = @exercice.ratings
  end


  private

  def set_exercice
    @exercice = Exercice.find(params[:id])
  end
end
