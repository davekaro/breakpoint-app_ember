module AuthenticationMacros
  def logged_in_user
    @user ||= create(:session_api_key).user
  end

  def valid_api_key
    logged_in_user.api_keys.active.first
  end

  def authenticate_request(token=valid_api_key.access_token)
    @request.headers['Authorization'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
end

