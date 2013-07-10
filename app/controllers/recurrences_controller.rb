class RecurrencesController < ApplicationController
  respond_to :json

  def create
    recurrence = current_user.recurrences.create(recurrence_params)
    respond_with recurrence
  end

  def update
    recurrence = current_user.recurrences.find(params[:id])
    recurrence.update_attributes(recurrence_params)
    respond_with recurrence
  end

  private

  def recurrence_params
    params.require(:recurrence).permit(:frequency)
  end
end
