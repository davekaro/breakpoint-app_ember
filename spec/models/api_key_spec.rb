require 'spec_helper'

describe ApiKey do
  it "generates access token" do
    api_key = create(:session_api_key)
    expect(api_key.new_record?).to be_false
    expect(api_key.access_token).to match(/\S{32}/)
  end

  it "sets the expired_at properly for 'session' scope" do
    Time.stub(:now).and_return(Time.at(0))
    api_key = create(:session_api_key)

    expect(api_key.expired_at).to eq 1.hours.from_now
  end

  it "sets the expired_at properly for 'cookie' scope" do
    Time.stub(:now).and_return(Time.at(0))
    api_key = create(:cookie_api_key)

    expect(api_key.expired_at).to eq 14.days.from_now
  end
end

