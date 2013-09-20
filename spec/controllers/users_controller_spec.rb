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
    expired_api_key = valid_api_key
    expired_api_key.update_attribute(:expired_at, 30.days.ago)
    ApiKey.active.pluck(&:id).include?(expired_api_key.id).should eq false
    authenticate_request(expired_api_key.access_token)
    get 'index'
    response.status.should eq 401
  end

  it "#index with valid token" do
    authenticate_request
    get 'index'
    results = JSON.parse(response.body)
    results['users'].first['first_name'].should eq @user.first_name
  end
end

