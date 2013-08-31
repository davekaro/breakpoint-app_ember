require 'spec_helper'

describe UsersController do
  it "#index without token in header" do
    get 'index'
    response.status.should eq 401
  end

  it "#index with invalid token" do
    get 'index', {}, { 'Authorization' => "Bearer 12345" }
    response.status.should eq 401
  end

  it "#index with expired token" do
    user = create(:user)
    expired_api_key = user.api_keys.session.create
    expired_api_key.update_attribute(:expired_at, 30.days.ago)
    ApiKey.active.map(&:id).include?(expired_api_key.id).should eq false
    @request.headers['Authorization'] = ActionController::HttpAuthentication::Token.encode_credentials(expired_api_key.access_token)
    get 'index'
    response.status.should eq 401
  end

  it "#index with valid token" do
    user = create(:user, first_name: 'Johnny')
    api_key = user.session_api_key
    @request.headers['Authorization'] = ActionController::HttpAuthentication::Token.encode_credentials(api_key.access_token)
    get 'index'
    results = JSON.parse(response.body)
    results['users'].first['first_name'].should eq 'Johnny'
  end
end

