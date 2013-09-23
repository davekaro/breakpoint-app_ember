require 'spec_helper'

describe SessionController do
  it "authenticates with email" do
    user = create(:user)
    post :create, { email: user.email, password: 'testing' }
    results = JSON.parse(response.body)
    expect(results['api_key']['access_token']).to match(/\S{32}/)
    expect(results['api_key']['user_id']).to eq user.id
  end

  it "fails to authenticate with invalid info" do
    user = create(:user)
    post :create, { email: user.email, password: 'huh' }
    expect(response.status).to eq 401
  end

  it "destroys sessions on request" do
    authenticate_request
    api_key = valid_api_key
    delete :destroy
    expect(response.status).to eq 200
    expect(ApiKey.active.find_by(access_token: api_key.access_token)).to be nil
  end
end

