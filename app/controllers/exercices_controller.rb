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

    if params[:format]
      @exercices = Exercice.where("muscle ILIKE ?", "%#{params[:format]}%")
    end

    if params[:query].present?
      @exercices = @exercices.find_all { |exercice| exercice.name.include?(params[:query]) }

      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "components/list_exercices", locals: {exercices: @exercices}, formats: [:html] }
      end
    end


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
