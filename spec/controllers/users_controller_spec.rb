require 'spec_helper'

describe UsersController do
  it "#index without token in header" do
    get 'index'
    expect(response.status).to eq 401
  end

  it "#index with invalid token" do
    get 'index', {}, { 'Authorization' => "Bearer 12345" }
    expect(response.status).to eq 401
  end

  it "#index with expired token" do
    expired_api_key = valid_api_key
    expired_api_key.update_attribute(:expired_at, 30.days.ago)
    expect(ApiKey.active.pluck(&:id)).not_to include(expired_api_key.id)
    authenticate_request(expired_api_key.access_token)
    get 'index'
    expect(response.status).to eq 401
  end

  it "#index with valid token" do
    authenticate_request
    get 'index'
    results = JSON.parse(response.body)
    expect(results['users'].first['first_name']).to eq logged_in_user.first_name
  end
end

