class UsersController < ApplicationController
  # commented out until ember side is fully implemented
  before_action :authenticate

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(params[:user])

    if user.save
      render json: user.session_api_key, status: 201
    else
      render json: { errors: user.errors.messages }, status: 422
    end
  end

   def update
    user = User.find(params[:id])

    user.update_attributes(params[:user])
    render json: user
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: user, status: 204
    else
      render json: user
    end
  end
end

