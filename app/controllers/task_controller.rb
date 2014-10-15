class TaskController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice: "You have created a new task!"
    else
      render 'new'
    end
  end

  def put
    @task = Task.find(params(:id))
    redirect_to task_path(@task.id)
  end 

  def edit
    @task = Task.find(params(:id))

  end

  def update
    @task = Task.find(params(:id))
    if @task.update_attributes(task_params)
      redirect_to task_path(@task.id)
    else
      render 'edit'
    end 
  end 


  def index 
    @task = Task.all
  end 

  private 
  
  def task_params
    params.require(:task).permit(:title, :completed, :description, :due_at)
  end

end