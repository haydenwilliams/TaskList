class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head 450
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      redirect_to task_path(task)
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path
  end

  def update_date
    task = Task.find(params[:id])

    task.update(
      completion_date: DateTime.current.to_date
    )

    redirect_to tasks_path
  end

  def destroy_all
    Task.where.not(completion_date: nil).destroy_all

    redirect_to tasks_path
  end

  private

  def task_params
    return params.require(:task).permit(:action, :description)
  end
end
