class TasksController < ApplicationController
  respond_to :json
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks.json
  def index
    @tasks = Task.includes(:user).map do |t|
      t.user_id && t.attributes.except(:user_id).merge({user: t.user.slice(:id, :name, :email)}) || t.attributes
    end
    render(json: {task: @tasks}, status: :ok)
  end

  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    render(json: {task: @task.attributes.merge(user: @task.user.slice(:id, :name, :email))}, status: :ok)
  end

  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: {task: @task}, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1.json
  def update
    if @task.update(task_params)
      render json: {task: @task}, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :description, :state, :user_id)
  end
end
