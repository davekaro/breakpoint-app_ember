require 'spec_helper'

describe TeamsController do
  it "#index" do
    authenticate_request
    team = create(:team, name: "Awesome team")
    get 'index'
    results = JSON.parse(response.body)
    expect(results['teams'].first['name']).to eq 'Awesome team'
  end

  it "#create" do
    authenticate_request
    expect {
      post 'create', { team: { name: 'Good team', singles_matches: 1, doubles_matches: 2 }}
    }.to change { Team.count }.by 1
  end
end

