class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    # raise
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

  private

  def rating_params
    params.require(:rating).permit(:flexibility, :muscular_effort, :breath_difficulty)
  end
end
