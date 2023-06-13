class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @exercice = Exercice.find(params[:exercice_id])
    @user = current_user
    @rating.exercice = @exercice
    @rating.user = @user
    if @rating.save
      redirect_to exercice_path(@exercice)
    else
      render "exercices/show", status: :unprocessable_entity
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @exercice = @rating.exercice.id
    @rating.update(rating_params)
    redirect_to exercice_path(@exercice)
  end

  private

  def rating_params
    params.require(:rating).permit(:flexibility, :muscular_effort, :breath_difficulty)
  end
end
