class Api::TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: tasks, status: 201
  end
end
