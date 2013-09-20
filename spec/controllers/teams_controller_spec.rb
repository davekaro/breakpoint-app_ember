require 'spec_helper'

describe TeamsController do
  it "#index" do
    authenticate_request
    team = create(:team, name: "Awesome team")
    get 'index'
    results = JSON.parse(response.body)
    results['teams'].first['name'].should eq 'Awesome team'
  end
end

