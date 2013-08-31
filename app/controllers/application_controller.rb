class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_user

  private

  def authenticate
    @current_user = authenticate_or_request_with_http_token do |token, options|
      api_key = ApiKey.active.find_by(access_token: token)
      api_key ? api_key.user : nil
    end
  end
end

