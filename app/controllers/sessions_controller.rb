class SessionsController < ApplicationController
  before_action :set_session, only: %i[update destroy]

  def create
    @session = Session.create(session_params)
    if @session.save
      redirect_to user_my_dashboard_path(current_user.id), status: :see_other
    else
      redirect_to user_my_dashboard_path(current_user.id), status: :unprocessable_entity
    end
  end

  def update
    if @session.update(session_params)
      redirect_to user_my_dashboard_path(current_user.id), status: :see_other
    else
      redirect_to user_my_dashboard_path(current_user.id), status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
    redirect_to user_my_dashboard_path(current_user.id), status: :see_other
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:programing_at, :training_id)
  end

end
