class TeamsController < ApplicationController
  def index
    render json: Team.all
  end

  def show
    render json: Team.find(params[:id])
  end

  def create
    team = Team.new(params[:team])

    if team.save
      render json: team
    else
      render json: { errors: team.errors.messages }, status: 422
    end
  end

   def update
    team = Team.find(params[:id])

    team.update_attributes(params[:team])
    render json: team
  end

  def destroy
    team = Team.find(params[:id])

    if team.destroy
      render json: team, status: 204
    else
      render json: team
    end
  end
end

