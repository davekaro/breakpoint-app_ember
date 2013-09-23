module AuthenticationMacros
  def logged_in_user
    @valid_api_key ||= create(:session_api_key)
    @logged_in_user ||= valid_api_key.user
  end

  def valid_api_key
    logged_in_user if @valid_api_key.nil?
    @valid_api_key
  end

  def authenticate_request(token=valid_api_key.access_token)
    @request.headers['Authorization'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
end

