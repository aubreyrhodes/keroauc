class TasksController < ApplicationController
  respond_to :json

  before_filter :load_task, only: [:show, :update, :destroy]

  def create
    task = current_user.tasks.create(task_params)
    respond_with task
  end

  def show
    respond_with @task
  end

  def index
    respond_with current_user.tasks.incomplete
  end

  def update
    @task.update_attributes(task_params)
    respond_with @task
  end

  def destroy
    @task.destroy
    respond_with status: :success
  end

  private

  def load_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :complete, :recurrence_id, :due_date)
  end
end
