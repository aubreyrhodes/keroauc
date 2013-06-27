class TasksController < ApplicationController
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  before_filter :load_task, only: [:show, :update, :destroy]

  def create
    task = Task.create(task_params)
    respond_with task
  end

  def show
    respond_with @task
  end

  def index
    respond_with Task.all
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
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end

  def render_404
    render nothing: true, status: 404
  end
end
