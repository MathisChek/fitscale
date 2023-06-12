class ExercicesController < ApplicationController
  before_action :set_exercice, only: %i[create show flexibility]
  def new
    raise
    @exercice = Exercice.new
  end

  def create
    @exercice.user = current_user
    raise
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
      @ratings = @exercice.ratings
      flexibility = 0
      breath = 0
      muscular = 0
      @ratings.each do |rating|
        flexibility += rating.flexibility
        breath += rating.breath_difficulty
        muscular += rating.muscular_effort
      end
      @flexibility_avg = flexibility.to_f / @ratings.count
      @breath_avg = breath.to_f / @ratings.count
      @muscular_avg = muscular.to_f / @ratings.count
      @rating_avg = (@flexibility_avg + @breath_avg + @muscular_avg) / 3.0
  end


  private

  def set_exercice
    @exercice = Exercice.find(params[:id])
  end
end
