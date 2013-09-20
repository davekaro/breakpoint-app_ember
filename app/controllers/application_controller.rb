class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_api_key, :current_user

  before_action :authenticate

  private

  def authenticate
    @current_api_key = authenticate_or_request_with_http_token do |token, options|
      ApiKey.active.find_by(access_token: token)
    end

    @current_user = @api_key ? @api_key.user : nil
  end
end

