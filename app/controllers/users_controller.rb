class UsersController < ApplicationController
  def index
    render json: {user: User.all}
  end

  def show
    render json: {user: User.find(params[:id].permit)}
  end
end
