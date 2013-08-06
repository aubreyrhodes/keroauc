class RecurrencesController < ApplicationController
  respond_to :json

  before_filter :load_recurrence, only: [:show, :update, :destroy]

  def index
    respond_with Recurrence.all
  end

  def create
    recurrence = RecurrenceScheduler.schedule(recurrence_params, current_user)
    respond_with recurrence
  end

  def update
    @recurrence.update_attributes(recurrence_params)
    respond_with @recurrence
  end

  def show
    respond_with @recurrence
  end

  def destroy
    @recurrence.destroy
    respond_with status: :success
  end

  private

  def recurrence_params
    params.require(:recurrence).permit(:frequency, :task_id)
  end

  def load_recurrence
    @recurrence = current_user.recurrences.find(params[:id])
  end
end
