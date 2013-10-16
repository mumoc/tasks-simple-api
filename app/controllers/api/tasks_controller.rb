class Api::TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: tasks, status: 201
  end

  def create
    task = Task.create(safe_params)
    render json: task, status: 201
  end

  def update
    task.update_attributes(safe_params)
    render json: task.reload, status: 204
  end

  def show
    render json: task, status: 201
  end

  def destroy
    task.destroy
    render nothing: true, status: 204
  end

  private
  def task
    @task || Task.find(params[:id])
  end

  def safe_params
    params.require(:task).permit(:title, :content)
  end
end
