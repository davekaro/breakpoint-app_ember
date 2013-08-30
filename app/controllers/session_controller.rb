class SessionController < ApplicationController
  #before_filter :ensure_authenticated_user, only: :destroy

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user.session_api_key, status: 201
    else
      render json: {}, status: 401
    end
  end

  def destroy
    current_user.reset_session_api_key
    render json: {}
  end
end

