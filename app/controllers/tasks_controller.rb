# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task_list
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = @task_list.tasks
    #binding.pry
  end

  def new
    @task = @task_list.tasks.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_list_tasks_path(@task.task_list), notice: "Task was successfully created."
      #When trying to create a new task, an error was thrown here
      #I fixed the redirect here. 

    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_list_tasks_path(@task_list), notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    redirect_to task_list_tasks_path(@task.task_list), notice: "Task was successfully destroyed."
    #I found another bug here.
  end

  private
    def set_task
      @task = @task_list.tasks.find(params[:id])
    end

    def set_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end

    def task_params
      params.require(:task).permit(:task_list_id, :complete, :description, :due_date)
    end
end
