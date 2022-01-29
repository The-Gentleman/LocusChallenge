# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task_list
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = @task_list.tasks
  end

  def new
    @task = @task_list.tasks.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_list_tasks_path(@task_list, @task), notice: "Task was successfully created."
      # when trying to create a new task, an error was thrown here
      #fix the "taskS" typo and redirected to task_lists
      #Also, not that it caused anything to break, but should I really be able to list a chore with a due date
      #set to Feburary of 1902?
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

    redirect_to task_lists_url(), notice: "Task was successfully destroyed."
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
