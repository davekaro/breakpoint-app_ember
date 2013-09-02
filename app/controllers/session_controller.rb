class SessionController < ApplicationController
  before_action :authenticate, only: :destroy

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user.generate_api_key(params[:rememberMe]), status: 201
    else
      render json: {}, status: 401
    end
  end

  def destroy
    current_api_key.expire!
    render json: {}
  end
end

